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
    total_cohort_scores = 0
    total_cohort_points = 0
    quizzes.each do |quiz|
      total_quiz_scores = 0
      total_quiz_points = 0
      quiz.questions.each do |question|
        total_question_scores = 0
        question.responses.each do |response|
          total_question_scores = total_question_scores + response.grade
        end
        if (question.responses.count > 0)
          total_question_scores = total_question_scores / question.responses.count
        else
          total_question_scores = 0
        end
        total_question_points = question.max_points
        total_quiz_scores = total_quiz_scores + total_question_scores
        total_quiz_points = total_quiz_points + total_question_points
      end
      total_cohort_scores = total_cohort_scores + total_quiz_scores
      total_cohort_points = total_cohort_points + total_quiz_points
    end

    if (total_cohort_points > 0)
      cohort_average_score = (total_cohort_scores * 100)/ total_cohort_points
    else
      cohort_average_score = 0
    end
    render json: {course: course, cohort: cohort, quiz_count: quiz_count, quizzes: quizzes, users: users, average: cohort_average_score}.to_json
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :course_id, :start_date, :end_date, :is_active)
  end

end
