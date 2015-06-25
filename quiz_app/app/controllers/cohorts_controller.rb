class CohortsController < ApplicationController

  require 'json'

  def index
    @cohorts = Cohort.all
  end

  def create
    cohort = Cohort.new
    cohort.update(cohort_params)
    redirect_to cohort_path(cohort)
  end

  def new
    @cohort = Cohort.new
  end

  def show
    @cohort = Cohort.find(params[:id])
    @users = User.all
  end

  def update
    cohort = Cohort.find(params[:id])
    cohort.update(cohort_params)
    redirect_to cohort_path(cohort)
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def enroll
    cohort = Cohort.find(params[:id])
    user = User.find(params[:user_id])
    cohort.users.append(user)
    redirect_to cohort_path(cohort)
  end

  def report # ajax call
    cohort = Cohort.find(params[:cohort_id])
    course = cohort.course.name
    quiz_count = cohort.quizzes.count
    quizzes = cohort.quizzes
    users = cohort.users
    total_scored = 0
    total_points = 0
    quizzes.each do |quiz|
      quiz.questions.each do |question|
        total_points = total_points + question.max_points
        question.responses.each do |response|
          total_scored = total_scored + response.grade
        end
      end
    end
    if (total_points > 0)
      average = total_scored / total_points
    else
      average = 0
    end
    render json: {course: course, cohort: cohort, quiz_count: quiz_count, quizzes: quizzes, users: users, average: average}.to_json
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :course_id, :start_date, :end_date, :is_active)
  end

end
