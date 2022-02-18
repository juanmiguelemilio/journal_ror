require "test_helper"

class TodoListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save without title" do
    todo_lists = TodoList.new
    todo_lists.title = ""
    assert_not todo_lists.save, "Saved blank title of todo list"
  end

  test "should not save without description" do
    todo_lists = TodoList.new
    todo_lists.description = ""
    assert_not todo_lists.save, "Saved todo list without description"
  end

  test "should not save description that does not met the minimum length" do
    todo_lists = TodoList.new
    todo_lists.description = "test"
    assert_not todo_lists.save, "Saved todo list less than minimum length of description"
  end

end
