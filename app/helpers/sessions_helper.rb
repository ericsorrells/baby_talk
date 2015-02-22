module SessionsHelper
  

  def sign_in(user)
    #create a new token:
    remember_token = User.new_remember_token 

    #put the token just created in the broswer cookie
    cookies.permanent[:remember_token] = remember_token

    #saved the hashed token to the database using the digest method
    ## from User model
    user.update_attribute(:remember_token, User.digest(remember_token))

    #set the current user equal to the given user
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    #set the remember_token equal to that stored in the cookie
    remember_token = User.digest(cookies[:remember_token])

    #find current_user based on the remember_token above
    ## if current_user undefined, will perform the search
    ## current_user is only undefined the first time this is called
    ## will only return @current_user after first call, and won't
    ## query the database again
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    #if user not signed in, store location and redirect to sign_in URL
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def signed_in?
    #if current_user isn't nil, user is signed in
    !current_user.nil?
  end

  def sign_out
    #change the remember_token in the DB
    current_user.update_attribute(:remember_token, 
                                  User.digest(User.new_remember_token))
    
    #delete the remember_token from the sesson
    cookies.delete(:remember_token)

    #set current_user to nil
    ##optional extra protection
    self.current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

end