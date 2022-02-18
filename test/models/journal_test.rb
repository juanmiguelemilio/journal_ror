require "test_helper"

class JournalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save without title" do
    journal = Journal.new
    journal.content = "sample"
    assert_not journal.save, "Saved journal without title"
  end
end
