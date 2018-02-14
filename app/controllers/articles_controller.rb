class ArticlesController < ApplicationController
  before_action :find_param, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    User.find_by_id(session[:username])
    @article.user = User.find_by_id(session[:user_id]) #hard coded user for now
    
    if @article.save
      flash[:success] = "The article successfully saved"
      redirect_to article_path(@article)
    else
      render 'new'
    end
      
    #@article.save
    #redirect_to articles_path(@article)
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "The article has been successfully updated"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 6)
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article #{@article.id} successfully destroyed"
    redirect_to articles_path
  end

  private
    def article_params
      #from the params hash, we will allow it to be passed in
      #then this method will be called by create, and the value will be saved
      params.require(:article).permit(:title, :description)
    end
    
    #method for show, edit, update, destroy
    def find_param
      @article = Article.find(params[:id])
    end
    
    def require_user
      if !logged_in?
        flash[:danger] = "You must login to perform this action"
        redirect_to root_path
      elsif current_user != @article.user
        flash[:danger] = "You do not have access to this action"
        redirect_to root_path
      end
    end
  
end