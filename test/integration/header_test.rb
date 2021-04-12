require 'test_helper'

class HeaderTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  #　ログイン後のテストが不十分
  test "header when logging in/not logging in" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    follow_redirect!
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", games_path
    assert_select "a[href=?]", grampus_players_path
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", logout_path

    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", games_path
    assert_select "a[href=?]", grampus_players_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
  end


end
