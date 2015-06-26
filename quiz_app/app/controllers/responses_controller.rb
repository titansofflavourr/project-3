class ResponsesController < ApplicationController

  def index
    @responses = Response.all
  end

  def create
    binding.pry
    # creating response using session and ajax params
    @response = Response.create(user_id: session[:user_id], question_id: params[:question_id],answer: params[:answer])
    
    # send response back to browser
    render json: @response

    
    # response = Response.new
    # response.update(response_params)
  end

  def new
    @response = Response.new
  end

  def show
    @response = Response.find(params[:id])
  end

  def update
    binding.pry
    student_response = Response.find(params[:id])
    @response = student_response.update(answer: params[:answer])
    render json: @response 
  end

  def edit
    @response = Response.find(params[:id])
  end

  private

  def response_params
    params.require(:response).permit(:user_id, :answer, :question_id, :grade, :comment)
  end

end
