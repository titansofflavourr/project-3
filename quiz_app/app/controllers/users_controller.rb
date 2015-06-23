class UsersController < ApplicationController

  before_action :authorize, except: [:create, :new]

  def index
    @users = User.all
  end

  def create
  end

  def new
  end

  def show
    @user = User.find session[:user_id]
  end

  def update
  end

  def edit
  end
end
