require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get games" do
    get games_path
    assert_response :success
  end
end
