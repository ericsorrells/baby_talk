class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
      #find the User in the DB from email
    if user && user.authenticate(params[:session][:password])
      #authenticate from has_secure_password:
      ## if user is found on line 1, and the info matches, then authenticate
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
end

  def destroy
    sign_out
    redirect_to root_url
  end

end

