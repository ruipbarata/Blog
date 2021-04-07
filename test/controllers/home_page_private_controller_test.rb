require "test_helper"

class HomePagePrivateControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get home_page_private_index_url
    assert_response :success
  end

end
