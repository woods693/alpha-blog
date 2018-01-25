class UsersController < ApplicationController
  before_action :find_param, only: [:edit, :update]
  
  def new
    @user = User.new  
  end
  
  def create
    @user = User.new(user_params) 
    if @user.save
      flash[:success] = "Welcome to the blog #{@user.username}!"
      redirect_to articles_path
    else
      #invalid user
      render 'new'
    end
  end
  
  def edit

  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  
  private
  def user_params
    #whitelisting the parameters
    params.require(:user).permit(:username, :email, :password)
  end
  
  def find_param
    @user = User.find(params[:id])
  end
  
end