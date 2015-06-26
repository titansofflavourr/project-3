class AssessmentsController < ApplicationController

  def index
    @assessments = Assessment.all
  end

  def create
    assessment = Assessment.new
    assessment.update(assessment_params)
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