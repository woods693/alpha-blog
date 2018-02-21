require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  #for show
  def setup
    @category = Category.create(name: "Test Category")
  end
  
  test "getting the index of categories" do
    get :index
    assert_response :success
  end
  
  test "get the new"do
    get :new
    assert_response :success
  end
  
  test "get show response" do
    #this generates the route for showing by passing the id using hash
    get(:show, {'id' => @category.id})
    assert_response :success
    
  end
  
end