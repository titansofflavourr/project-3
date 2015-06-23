class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def create
    course = Course.new
    course.update(course_params)
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def update
    course = Course.find(params[:id])
    course.update(course_params)
  end

  def edit
    @course = Course.find(params[:id])
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end
end
