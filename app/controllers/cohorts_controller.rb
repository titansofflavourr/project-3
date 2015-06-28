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
    users = []
    cohort.users.each do |user|
      if not (user.is_instructor)
        users.push(user)
      end
    end
    cohort_average = 0
    cohort_count = 0
    users.each do |user|
      assessments = user.assessments
      user_average = 0
      count = 0
      assessments.each do |assessment|
        if (assessment.student_score) && (assessment.quiz.total_points > 0)
          percent = (assessment.student_score * 100) / assessment.quiz.total_points
          user_average = user_average + percent
          count = count + 1
        end
      end
      if (count > 0)
        user_average = user_average / count
        cohort_average = cohort_average + user_average
        cohort_count = cohort_count + 1
      end
    end
    if (cohort_count > 0)
      cohort_average = cohort_average / cohort_count
    else
      cohort_average = "NA"
    end

    render json: {course: course, cohort: cohort, quiz_count: quiz_count, quizzes: quizzes, users: users, average: cohort_average}.to_json
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :course_id, :start_date, :end_date, :is_active)
  end

end
