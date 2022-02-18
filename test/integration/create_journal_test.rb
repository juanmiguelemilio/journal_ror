require "test_helper"

class CreateJournalTest < ActionDispatch::IntegrationTest
  test "should get create new journal" do
    get new_journal_path
    assert_response :success
    assert_difference 'Journal.count', 1 do
      post journal_path, params: { journal: { title: 'Title', content: 'Sample content', category_id: 1, user_id: 1 }}
      assert_response :redirect 
    end

    follow_redirect!
    assert_response :success
  end
end
