require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not register without email" do
    user = User.new
    user.email = ""
    assert_not user.save, "Successful registration"
  end

  test "should not register without name" do
    user = User.new
    user.name = ""
    assert_not user.save, "Successful registration"
  end

  test "should not register without surname" do
    user = User.new
    user.surname = ""
    assert_not user.save, "Successful registration"
  end
end
