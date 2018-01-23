class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "The article successfully saved"
      redirect_to article_path(@article)
    else
      render 'new'
    end
      
    #@article.save
    #redirect_to articles_path(@article)
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "article has been successfully updated"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end
  
  def index
    @article_all = Article.all
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article #{@article.id} successfully destroyed"
    redirect_to articles_path
  end

  private
    def article_params
      #from the params hash, we will allow it to be passed in
      #then this method will be called by create, and the value will be saved
      params.require(:article).permit(:title, :description)
    end
  
end