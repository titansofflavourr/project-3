class QuizzesController < ApplicationController

  require 'json'

  def index
    if not session[:is_instructor]
      @cohort = Cohort.find(params[:cohort_id])
      @quizzes = Quiz.where(cohort: params[:cohort_id])
      render 'student_index'
    else 
      @cohorts = Cohort.all
      @quizzes = Quiz.all
    end
  end

  def create
    quiz = Quiz.new
    quiz.update(quiz_params)
    redirect_to "/quizzes/#{quiz.id}/edit"
  end

  def new
    @quiz = Quiz.new(user_id: session[:user_id], cohort_id: params[:cohort_id])
  end

  def show
    if not session[:is_instructor]
      @cohort = Cohort.find(params[:cohort_id])
      @quiz = Quiz.find(params[:id])
      # find questions from quiz and if user has responses
      @questions = @quiz.questions
      @user = User.find(session[:user_id])
      render 'student_show'
    end
  end

  def update
    quiz = Quiz.find(params[:id]) 
    quiz.update(quiz_params)
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def take
    @user = User.find(session[:user_id])
    render :take_quiz
  end

  def copy
    # copy quiz
    old_quiz = Quiz.find(params[:id])
    new_quiz = old_quiz.dup
    new_quiz.is_active = :true
    new_quiz.user_id = session[:user_id]
    new_quiz.cohort_id = params[:cohort_id]
    new_quiz.date_assigned = params[:date_assigned]
    new_quiz.save
    #copy questions
    old_quiz.questions.each do |old_question| 
      new_question = old_question.dup
      new_question.quiz_id = new_quiz.id
      new_question.save
      #copy choices
      old_question.choices.each do |old_choice|
        new_choice = old_choice.dup
        new_choice.question_id = new_question.id
        new_choice.save
      end
    end
    redirect_to "/quizzes/#{new_quiz.id}/edit"
  end

  def report #ajax call
    quiz = Quiz.find(params[:quiz_id])
    questions = quiz.questions.count
    assessments = quiz.assessments.count
    average_score = quiz.assessments.average('student_score')
    total_points = quiz.total_points
    if (quiz.total_points > 0)
      percent = (average_score * 100) / quiz.total_points
    else
      percent = "NA"
    end
    render json: {quiz: quiz, questions: questions, assessments: assessments,
      average_score: average_score, total_points: total_points, percent: percent}.to_json
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :instructions, :answer_key, :is_active, :user_id, :cohort_id, :date_assigned, :total_points)
  end

end

