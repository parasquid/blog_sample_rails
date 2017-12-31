require 'test_helper'

class VueControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get vue_hello_url
    assert_response :success
  end

end
