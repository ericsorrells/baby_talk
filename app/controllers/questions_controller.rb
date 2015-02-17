class QuestionsController < ApplicationController
  def index
    #make only questions with no answers
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])        
  end
  
  def new
    #no new questions allowed at this time
    #@question = Question.new
  end

  def create
    #no new questions allowed at this time
    ##add User id so question is specific to user
    # @question = Question.new(params.require(:question).permit(:content))
    # if @question.save
    #   redirect_to @question, notice: 'Question Was Succesffully Created!'
    # else
    # render 'new'
    # end  
  end

  def edit
    #no editing of questions allowed - admin?
    #@question = Question.find(params[:id])    
  end

  def update
    #no updating of questions is allowed at this time
    # @question = Question.find(params[:id])
    # if @question.update_attributes(params.require(:question).permit(:sequence, :content))
    #   redirect_to questions_path  
    # else
    #   render 'edit'
    # end
  end

  def destroy
    #destroying questions not allowed
  end

end
