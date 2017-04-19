class SessionsController < ApplicationController
  # login form
  def new
  end

  # to login
  def create
    # authenticate email-password combination (after email stripped of whitespace)
    if user = User.authenticate_with_credentials(params[:email].strip, params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:notice] = "User authentication failed. Password or email incorrect."
      redirect_to '/login'
    end
  end

  # to logout
  def destroy
    flash[:notice] = "You have successfully been logged out. Come back soon!"
    session[:user_id] = nil
    redirect_to '/login'
  end
end
