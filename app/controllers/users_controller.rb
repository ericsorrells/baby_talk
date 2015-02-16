class UsersController < ApplicationController
  

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Account Successfully Created"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end

  private

  #user_params provide better security by controller access to attributes in private methods
  def user_params
    params.require(:user).permit(:name, :email, :phone, :password)
  end

end

