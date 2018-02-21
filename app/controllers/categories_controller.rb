class CategoriesController < ApplicationController
before_action :is_admin?, only: [:create, :new]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)
  end
  
  def create
    @category = Category.new(category_param)
    if @category.save
      flash[:success] = "Category saved successfully"
      redirect_to categories_path
    else
      flash[:danger] = "Category not successfully saved"
      render 'new'
    end
  end
  
  def new
    @category = Category.new
  end
  
  def show
    
  end
  
  private
  
  def category_param
    params.require(:category).permit(:name)
  end

  def is_admin?
    if !logged_in? || (logged_in? && current_user.admin == false)
      flash[:danger] = "You do not have access to this action"
      redirect_to categories_path
    end
  end
end