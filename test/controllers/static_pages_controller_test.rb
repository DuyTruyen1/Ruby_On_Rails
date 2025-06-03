require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get static_pages_hello_url
    assert_response :success
  end
end
