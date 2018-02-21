require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test 'get and create new category' do
    #get request for a new category
    get new_category_path
    #checks if the view for categories new exists
    assert_template "categories/new"
    #function for checking if post successfully creates a new category by doing a difference
    assert_difference 'Category.count', 1 do
      #post a new category
      post_via_redirect categories_path, category: {name: "sports"}
    end
    #checks if the view showing all categories exists
    assert_template "categories/index"
    #checks if sports is in the index
    assert_match "sports", response.body
  end
  
  
  test 'invalid category submission resulting in failure' do
    get new_category_path
    assert_template "categories/new"
    #checks if their is no difference because empty category should not be saved
    assert_no_difference "Category.count" do
      post categories_path, category: {name: " "}
    end
    #set to redirect to new when save fails
    assert_template "categories/new"
    #this is from the errors.html.erb file, if error message is rendered this shows up
    assert_select "h3.panel-title"
    assert_select "div.panel-body"
  end
end