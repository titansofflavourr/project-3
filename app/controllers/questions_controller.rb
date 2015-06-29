class QuestionsController < ApplicationController

  require 'json'

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new
    if question.update(question_params)
      redirect_to "/question/#{question.id}"
    else
      redirect_to "questions/new"
    end
  end

  def add #ajax call
    if (params[:is_multiple_choice] == "true")
      answer = params[:mc_answer_key]
    else
      answer = params[:sa_answer_key]
    end
    question = Question.create({number: params[:number], prompt: params[:prompt], answer_key: answer, is_multiple_choice: params[:is_multiple_choice], max_points: params[:max_points], quiz_id: params[:quiz_id]}); 
    choices = params[:choices]
    i = 0
    choices.each do |option|
      if (option != "")
        key = (i+97).chr
        question.choices.create({question_id: question.id, option: option, key: key})
        i = i + 1
      end
    end
    # choices.each_with_index do |option, i|
    #   if (option != "")
    #     key = (i+97).chr
    #     question.choices.create({question_id: question.id, option: option, key: key})
    #   end
    # end
    render json: {question: question, choices: question.choices}.to_json
  end 

  def show
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
  end

  def edit
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:number, :prompt, :answer_key, :is_multiple_choice, :max_points, :quiz_id)
  end

end
