class DashboardsController < ApplicationController

	before_action :authorize

	def index
		if (session[:user_id])
			@users = User.all
	    @cohorts = Cohort.all
	    @quizzes = Quiz.all
	    @user = User.find(session[:user_id])
			render :dashboard
		else
			redirect_to '/login'
		end
	end

	def report
		if (session[:is_instructor])
		 @cohorts = Cohort.all
		 @quizzes = Quiz.all
		 render :report
		else
			redirect_to "/users/#{session[:user_id]}"
		end
	end

end

