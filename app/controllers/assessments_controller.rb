class AssessmentsController < ApplicationController

  def index
    @assessments = Assessment.all
  end

  def create
    if not session[:is_instructor]
    assessment = Assessment.create(quiz_id: params[:quiz_id], user_id: session[:user_id])
    @empty_responses = params[:blanks]
    
    @empty_responses.each do |question_id|
        Response.create(question_id: question_id, user_id: session[:user_id], answer: "NO ANSWER SUBMITTED")
    end

    redirect_to '/'
    end
  end

  def new
    @assessment = Assessment.new
  end

  def show
    if not session[:is_instructor]
      @assessment = Assessment.find(params[:id])
      @quiz = Quiz.find(params[:quiz_id])
      @user= User.find(session[:user_id])
      @cohort = Cohort.where(user_id: @user.id)
      render 'assessment_student_show'
    else 
      @assessment = Assessment.find(params[:id])
      render 'show' 
    end
  end

  def update
    assessment = Assessment.find(params[:id])
    quiz_id = params[:quiz_id]
    question_ids =[]
    Quiz.find(quiz_id).questions.each do |question|
      question_ids.push(question.id)  
    end
    totalScore = 0
    Response.where({user_id: params[:user_id]}).each do |response|
      if response.grade
        if question_ids.include?(response.question_id)
          totalScore += response.grade
        end
      end
    end

    assessment.update(student_score:totalScore, status:"graded")
    render json: totalScore
  end

  def edit
    @assessment = Assessment.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @cohort = @quiz.cohort
    @user = @assessment.user
  end

  private

  def assessment_params
    params.require(:assessment).permit(:user_id, :quiz_id, :student_score, :comment, :status)
  end

end