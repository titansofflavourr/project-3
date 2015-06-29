class ChoicesController < ApplicationController

  def index
    @choices = Choice.all
  end

  def create
    choice = Choice.new
    choice.question_id = params[:question_id]
    choice.option = params[:option]
    choice.key = params[:key]
    choice.save
    # choice.update(choice_params)
    choice
  end

  def new
    @choice = Choice.new
  end

  def show
    @choice = Choice.find(params[:id])
  end

  def update
    choice = Choice.find(params[:id])
    choice.update(choice_params)
  end

  def edit
    @choice = Choice.find(params[:id])
  end

  private

  def choice_params
    params.require(:choice).permit(:question_id, :option, :key)
  end

end
