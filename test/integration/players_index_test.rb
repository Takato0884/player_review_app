require 'test_helper'

class PlayersIndexTest < ActionDispatch::IntegrationTest

  test "index should include all players" do
    get grampus_players_path
    assert_template "grampus_players/index"
    players = GrampusPlayer.all
    players.each do |player|
      assert_select "span", player.name
      assert_select 'a[href=?]', grampus_player_path(player), text: "詳細"
    end
  end
  
end
