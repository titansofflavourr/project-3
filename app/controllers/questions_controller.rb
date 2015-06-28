class QuestionsController < ApplicationController

  require 'json'

  def index
    @questions = Question.all
  end

  def create
    if (params[:is_multiple_choice] == 'true')
      answer = params[:mc_answer_key]
    else
      answer = params[:sa_answer_key]
    end
    question = Question.create({number: params[:number], prompt: params[:prompt], answer_key: answer, is_multiple_choice: params[:is_multiple_choice], max_points: params[:max_points], quiz_id: params[:quiz_id]}); 
    params["choices"].each_with_index do |choice, i|
      if (choice != "")
        question.choices.create({question_id:question.id, option: choice, key:(i+97).chr})
      end
    end 
    if (question.choices)
      choices = question.choices
    else
      choices = []
    end
    render json: {question: question, choices: choices}.to_json
  end 

  def new
    @question = Question.new
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
