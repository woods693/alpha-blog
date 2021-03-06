class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #saving id into the session
      session[:user_id] = user.id
      flash[:success] = "Logged In"
      redirect_to root_path
    else
      flash.now[:danger] = "Incorrect Login Credentials"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
  
end