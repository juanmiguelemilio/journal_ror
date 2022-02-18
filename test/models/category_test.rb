require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not save without category" do
    category = Category.new
    category.category = ""
    assert_not category.save, "Saved blank category"
  end
end
