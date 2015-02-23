class BabiesController < ApplicationController
  before_action :set_baby, only: [:edit]
  before_action :signed_in_user, only: [:edit]
  before_action :correct_user, only: [:edit]

  def edit
    @baby = Baby.find(params[:id])
  end
  
  def update
    @baby = Baby.find(params[:id])
    if @baby.update_attributes(baby_params)
      flash[:success] = "Baby Information Updated!"
      redirect_to user_path(current_user.id), notice: "Your Baby's Info Was Sucessfully Edited!"
    else
      render 'new'
    end
  end

  def new
    @baby = Baby.new
  end

  def create
    @baby = Baby.new(baby_params)
    if @baby.save
      flash[:success] = "You New Baby Has Been Added To Your Profile - Congraultions!"
      redirect_to user_path(current_user.id), notice: 'Your Baby Was Sucessfully Added!'
    else
      render 'new'
    end
  end

  def destroy
    @baby = Baby.find(params[:id])
    @baby.destroy
    flash[:success] = "This Baby Has Been Deleted"
    redirect_to user_path(current_user.id), notice: 'This Baby Has Been Removed!'
  end

  private

    def baby_params
      params.require(:baby).permit(:name, :sex, :month, :day, :year, :user_id)
    end  

    def correct_user
      puts "BABY: #{@baby}"
      unless current_user?(@baby.user_id) || current_user.admin?
        #redirect_to user_path(current_user)
      end
      puts "CURRENT USER: #{current_user.name}-#{current_user.id}"
    end

    def set_baby
      puts "SET BABY - Before"
      @baby = Baby.find(params[:id])
      puts "SET BABY - After - #{@baby.name}: #{@baby.user_id}"
    end

end