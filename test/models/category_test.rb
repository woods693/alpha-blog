require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  #method will run before every other test
  def setup
    @category = Category.new(name: "sports")
  end
  
  test "This is the valid category test" do
    assert @category.valid?    
  end

  test "category name needs to not be empty" do
    @category.name = " "
    assert_not @category.valid?
  end
  
  test "category name should be unique" do
    @category.save
    @category2 = Category.new(name: "sports")
    assert_not @category2.valid?
  end
  
  test "name not too long" do
    @category.name = "a" * 30
    assert_not @category.valid?
  end
  
  test "name not too short" do 
    @category.name = "aa"
    assert_not @category.valid?
  end
  
end