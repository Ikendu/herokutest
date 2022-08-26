require "test_helper"

class DecoControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get deco_page_url
    assert_response :success
  end
end
