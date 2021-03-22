require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get games" do
    get games_path
    assert_response :success
  end

  test "should get grampus_players" do
    get grampus_players_path
    assert_response :success
  end

end
