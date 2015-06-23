class SessionsController < ApplicationController

	#render login form
  def new
    
  end

  #creates a session
  def create
    user = User.find_by({email: params[:email]})
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:is_instructor] = user.is_instructor
      redirect_to user_path(user)
    else
      # rerender the form
      redirect_to '/login'
    end
  end

  #nulls user session (logout)
  def destroy
  	session[:user_id] = nil
    session[:is_instructor] = nil
  	redirect_to '/login'
  end

end