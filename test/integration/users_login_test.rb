require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert is_logged_in?
  end

  test "login with invalid informartion" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: {session: {email: "", password: ""}}
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
    assert_not is_logged_in?
  end

  test "login with valid email/invalid password" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: {session: {email: @user.email,
                                        password: "invalid"}}
    assert_template "sessions/new"
    assert_not flash.empty?
    assert_not is_logged_in?
    get root_path
    assert flash.empty?
  end
end
