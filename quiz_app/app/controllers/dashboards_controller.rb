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

end

