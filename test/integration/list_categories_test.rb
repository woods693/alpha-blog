require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    @category = Category.create(name: "sport")
    @category2 = Category.create(name: "technology")
    @category3 = Category.create(name: "people")
  end
  
  test "show all categories listed" do
    #get to category listing page
    get categories_path
    assert_template "categories/index"
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
    assert_select "a[href=?]", category_path(@category3), text: @category3.name
  end
end