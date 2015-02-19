class AnswersController < ApplicationController

  def index
    @unanswered_questions = Question.get_unanswered_questions(current_user)
                 @answers = Answer.where(user_id: current_user)
  end

  def edit
    @question = Answer.find(params[:id]).question
    @answer   = Answer.find(params[:id]) 
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params.require(:answer).permit(:content))
      redirect_to answers_path  
    else
      render 'edit'
    end 
  end

  def new
    @question = Question.find(params[:id])
    @answer   = Answer.new     
  end

  def create
    @answer = Answer.new(params.require(:answer).permit(:content, :question_id, :user_id))
    @question = Question.find(@answer.question_id)
    if @answer.save
        redirect_to answers_path, notice: 'Answer Was Successfully Created!'
    else
        render 'new'
    end
  end

end