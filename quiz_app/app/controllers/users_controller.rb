class UsersController < ApplicationController

  before_action :authorize, except: [:create, :new]

  def index
    @users = User.all
  end

  def create
    user = User.new
    if user.update(user_params)
      session[:user_id] = user.id
      session[:is_instructor] = user.is_instructor
      redirect_to user_path(user)
    else
      # rerender the form
      redirect_to '/users/new'
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(session[:user_id])
  end

  def update
    user = User.find(session[:user_id])
    user.update(user_params)
    redirect_to user_path(user) 
  end

  def edit
    # can instructors edit students' profiles?
    @user = User.find(session[:user_id]) 
  end

  private

  def user_params
    params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation)
  end

end
