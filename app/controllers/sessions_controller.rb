class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #saving id into the session
      session[:user_id] = user.id
      flash.now[:success] = "Logged In"
      redirect_to users_path(user)
    else
      flash.now[:danger] = "Incorrect Login Credentials"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash.now[:success] = "You have logged out"
    redirect_to root_path
  end
  
  
end