require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should be signup_path" do
    get login_path
    assert_select "a[href=?]", signup_path
  end

end
