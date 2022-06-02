require "test_helper"

class IzipayControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get izipay_index_url
    assert_response :success
  end
end
