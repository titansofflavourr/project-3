class QuizzesController < ApplicationController

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

  private

  def quiz_params
    params.require(:quiz).permit(:title, :instructions, :answer_key, :is_active, :user_id)
  end

end
