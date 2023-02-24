require "test_helper"

class YoutusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get youtus_index_url
    assert_response :success
  end
end
