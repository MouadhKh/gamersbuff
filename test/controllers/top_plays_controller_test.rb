require 'test_helper'

class TopPlaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get top_plays_index_url
    assert_response :success
  end

end
