class AssessmentsController < ApplicationController

  def index
    @assessments = Assessment.all
  end

  def create
    if not session[:is_instructor]
    binding.pry
    assessment = Assessment.create(quiz_id: params[:quiz_id], user_id: session[:user_id])
    redirect_to user_path
    end
  end

  def new
    @assessment = Assessment.new
  end

  def show
    @assessment = Assessment.find(params[:id])
  end

  def update
    assessment = Assessment.find(params[:id])
    assessment.update(assessment_params)
  end

  def edit
    @assessment = Assessment.find(params[:id])
  end

  private

  def assessment_params
    params.require(:assessment).permit(:user_id, :quiz_id, :student_score, :comment, :status)
  end

end