require 'test_helper'

class HeaderTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  # test "header when not logging in" do
  #   get root_path
  #   assert_select "a[href=?]", root_path
  #   assert_select "a[href=?]", games_path
  #   assert_select "a[href=?]", grampus_players_path
  #   assert_select "a[href=?]", login_path
  #   assert_select "a[href=?]", logout_path, count: 0
  # end

  test "header when logging in/not logging in" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    follow_redirect!
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", games_path
    assert_select "a[href=?]", grampus_players_path
    assert_select "a[href=?]", login_path, count: 0
    #設定のurlに関するテストをここに追加
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
