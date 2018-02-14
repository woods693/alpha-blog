class UsersController < ApplicationController
  before_action :find_param, only: [:edit, :update, :show]
  before_action :require_user, only: [:edit, :update]
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
  
  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end
  
  
  private
  def user_params
    #whitelisting the parameters
    params.require(:user).permit(:username, :email, :password)
  end
  
  def find_param
    @user = User.find(params[:id])
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must login to perform this action"
      redirect_to root_path
    elsif current_user != @user
      flash[:danger] = "You cannot edit this account"
      redirect_to users_path
    end
  end
  
end