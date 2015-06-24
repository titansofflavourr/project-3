class DashboardsController < ApplicationController

	def index
    @users = User.all
    @cohorts = Cohort.all
    @quizzes = Quiz.all
    @user = User.find(session[:user_id])
		render :dashboard
	end

end