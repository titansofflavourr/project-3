class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def create
    question = Question.new
    question.update(question_params)
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
  end

  def edit
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:number, :prompt, :answer_key, :is_multiple_choice, :max_points)
  end

end
