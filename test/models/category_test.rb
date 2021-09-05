require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(names: "Sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "names should be present" do
    @category.names = " "
    assert_not @category.valid?
  end

  test "names should be unique" do
    @category.save
    @category2 = Category.new(names: "Sports")
    assert_not @category2.valid?
  end
  test "names should not be too long" do
    @category.names = "a" * 26
    assert_not @category.valid?
  end
  test "names should be too short" do
    @category.names = "a"
    assert_not @category.valid?
  end
end
