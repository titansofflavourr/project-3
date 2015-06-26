class QuizzesController < ApplicationController

  require 'json'

  def index
    if not session[:is_instructor]
      @cohort = Cohort.find(params[:cohort_id])
      @quizzes = Quiz.where(cohort: params[:cohort_id])
      render 'student_index'
    else 
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
