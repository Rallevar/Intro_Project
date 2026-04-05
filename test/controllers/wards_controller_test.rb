require "test_helper"

class WardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wards_index_url
    assert_response :success
  end
end
