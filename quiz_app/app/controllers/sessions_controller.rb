class SessionsController < ApplicationController

	#renders the login form
  def new 
  end

  #creates a session
  def create
    user = User.find_by({email: params[:email]})
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = "#{user.f_name} #{user.l_name}"
      session[:is_instructor] = user.is_instructor
      redirect_to user_path(user) #dashboard
    else
      # rerender the form
      redirect_to '/login'
    end
  end

  #nulls user session (logout)
  def destroy
  	session[:user_id] = nil
    session[:user_name] = nil
    session[:is_instructor] = nil
  	redirect_to '/login'
  end

end