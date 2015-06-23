class ClassesController < ApplicationController

  def index
    @classes = Class.all
  end

  def create
    xclass = Class.new
    xclass.update(class_params)
  end

  def new
    @class = Class.new
  end

  def show
    @class = Class.find(params[:id])
  end

  def update
    xclass = Class.find(params[:id])
    xclass.update(class_params)
  end

  def edit
    @class = Class.find(params[:id])
  end

  private

  def class_params
    params.require(:class).permit(:f_name, :l_name, :email, :password, :password_confirmation)
  end

end
