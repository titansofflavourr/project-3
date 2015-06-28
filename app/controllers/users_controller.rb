class UsersController < ApplicationController

  require 'json'

  before_action :authorize, except: [:create, :new]

  def index
    @users = User.all
  end

  def create
    user = User.new
    if user.update(new_user_params)
      redirect_to user_path(user)
    else
      redirect_to '/users/new'
    end
  end

  def new
    @user = User.new
  end

  def show
    if session[:is_instructor]
      @user = User.find(params[:id])
    else
      @user = User.find(session[:user_id])
    end
    @cohorts = Cohort.all
  end

  def update
    if session[:is_instructor]
      user = User.find(params[:id])
    else
      user = User.find(session[:user_id])
    end
    user.update(edit_user_params)
    redirect_to user_path(user) 
  end

  def edit
    if session[:is_instructor]
      @user = User.find(params[:id])
    else
      @user = User.find(session[:user_id])
    end 
  end

  def send_invite
    @user = User.find(params[:id])
    @user.invite!
    redirect_to @user
  end 

  def enroll
    user = User.find(params[:id])
    cohort = Cohort.find(params[:cohort_id])
    user.cohorts.append(cohort)
    redirect_to user_path(user)
  end

  def report #ajax call
    user = User.find(params[:student_id])
    assessments = user.assessments
    average = 0
    count = 0
    quizzes = []
    assessments.each do |assessment|
      if (assessment.quiz.total_points > 0)
        percent = (assessment.student_score * 100) / assessment.quiz.total_points
        average = average + percent
        count = count + 1
      else
        percent = "NA"
      end
      quizzes.push({quiz: assessment.quiz, assessment: assessment, percent: percent})
    end
    if (count > 0)
      average = average / count
    else
      average = "NA"
    end
    render json: {user: user, quizzes: quizzes, average: average}.to_json
  end

  private

  def new_user_params
    params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation)
  end

  def edit_user_params
    params.require(:user).permit(:f_name, :l_name, :email, :is_active, :is_instructor)
  end

end
