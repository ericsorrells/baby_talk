class UsersController < ApplicationController
  before_action :signed_in_user,  only: [:edit, :update, :destroy]

  #calls correct_user to determine if user should have access to the page before it loads
  before_action :correct_user,    only: [:edit, :update] 

  #before page is loaded, checks if admin and redirects if not
  before_action :admin_user, only: [:destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @babies = @user.babies
  end

  def new
    @user = User.new
  end
  
  def create
    puts "CREATE: params = #{params}"
    @user = User.new(user_params)
    puts "About to save user: #{@user.inspect}"
    if @user.save
      sign_in @user
      flash[:success] = "Account Successfully Created!"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def edit
    puts "EDIT START"
      @user = User.find(params[:id])
    puts "EDIT END: #{@user.name}"
  end

  def update
    puts "UPDATE: params = #{params}"
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      puts "UPDATED: #{@user.name}"
      flash[:success] = "Profile Updated!"
      redirect_to user_path @user
    else
      puts "NO UPDATE: #{@user.name}"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "User Deleted!"
    redirect_to users_url
  end

  private

  #user_params provide better security by controller access to attributes in private methods
    def user_params
      params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
    end

    def correct_user
      #gets user, and compares it to current user
      ##if different, redirects to home page
      @user = User.find(params[:id])
      puts "CORRECT USER [before]: #{@user.id}"
      redirect_to(root_path) unless current_user?(@user)
      puts "CORRECT USER [after]: #{@user.id}"
    end

    def admin_user
      #unless an admin, it will redirect to root URL
     redirect_to(root_url) unless current_user.admin?
    end
end