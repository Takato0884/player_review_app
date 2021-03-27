require 'test_helper'

class GrampusPlayersControllerTest < ActionDispatch::IntegrationTest

  test "should be index" do
    get grampus_players_path
    assert_response :success
  end
  
end
