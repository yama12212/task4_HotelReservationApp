require "test_helper"

class SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get area" do
    get searches_area_url
    assert_response :success
  end
end
