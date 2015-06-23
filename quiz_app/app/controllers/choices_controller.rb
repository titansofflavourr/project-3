class ChoicesController < ApplicationController

  def index
    @choices = Choice.all
  end

  def create
    choice = Choice.new
    choice.update(choice_params)
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
    params.require(:choice).permit(:option, :key)
  end

end
