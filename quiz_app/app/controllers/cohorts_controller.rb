class CohortsController < ApplicationController

  def index
    @cohorts = Cohort.all
  end

  def create
    cohort = Cohort.new
    cohort.update(cohort_params)
  end

  def new
    @cohort = Cohort.new
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def update
    cohort = Cohort.find(params[:id])
    cohort.update(cohort_params)
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :is_active)
  end

end
