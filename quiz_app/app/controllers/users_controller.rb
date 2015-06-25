class UsersController < ApplicationController

  before_action :authorize, except: [:create, :new]

  def index
    @users = User.all
  end

  def create
    user = User.new
    # if already logged in as instructor
    if session[:is_instructor]
      if user.update(new_user_params)
        redirect_to user_path(user)
      else
        redirect_to "/users/#{session[:user_id]}"
      end
    else #new user
      if user.update(new_user_params)
        session[:user_id] = user.id
        session[:user_name] = "#{user.f_name} #{user.l_name}"
        session[:is_instructor] = user.is_instructor
        redirect_to user_path(user)
      else
        redirect_to '/users/new'
      end
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

  private

  def new_user_params
    params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation)
  end

  def edit_user_params
    params.require(:user).permit(:f_name, :l_name, :email, :is_active, :is_instructor)
  end

end
