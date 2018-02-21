require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  #for show
  def setup
    @category = Category.create(name: "Test Category")
    @user = User.create(username: "bam", email: "bam@email.com", password: "bam123", admin: true)
  end
  
  test "getting the index of categories" do
    get :index
    assert_response :success
  end
  
  test "get the new"do
    #simulating logged in user
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  
  test "get show response" do
    #this generates the route for showing by passing the id using hash
    get(:show, {'id' => @category.id})
    assert_response :success
    
  end
  
  test "redirect if user is not admin" do
    assert_no_difference "Category.count" do
      post :create, category: { name: "sports" }
    end
    assert_redirected_to  categories_path
  end
end