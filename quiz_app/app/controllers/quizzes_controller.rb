class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.new
  end

  def create
    quiz = Quiz.new
    quiz.update(quiz_params)
  end

  def new
    @quiz = Quiz.new
  end

  def show
    @quiz = Quiz.find(params[:id])
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
