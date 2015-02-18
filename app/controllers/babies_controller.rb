class BabiesController < ApplicationController

  def edit
    @baby = Baby.find(params[:id])
  end
  
  def update
    @baby = Baby.find(params[:id])
    if @baby.update_attributes(params.require(:baby).permit(:name, :sex, :month, :day, :year))
      redirect_to user_path(current_user.id), notice: "Your Baby's Info Was Sucessfully Edited!"
    else
      render 'new'
    end
  end

  def new
    @baby = Baby.new
  end

  def create
    @baby = Baby.new(params.require(:baby).permit(:name, :sex, :month, :day, :year, :user_id))
    if @baby.save
      redirect_to user_path(current_user.id), notice: 'Your Baby Was Sucessfully Added!'
    else
      render 'new'
    end
  end

  def destroy
    @baby = Baby.find(params[:id])
    @baby.destroy
    redirect_to user_path(current_user.id), notice: 'This Baby Has Been Removed!'
  end
end