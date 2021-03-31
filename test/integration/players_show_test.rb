require 'test_helper'

class PlayersShowTest < ActionDispatch::IntegrationTest

  def setup
    @player = grampus_players(:langerak)
  end

  test "game_show display" do
    get grampus_player_path(@player)
    assert_template "grampus_players/show"
    assert_select "h1", @player.name+"の出場試合"
    game_count = Game.count
    game_nums = Range.new(1,game_count)
    participated_game_list = []
    game_nums.each do |game_num|
      if @player.send("game#{game_num}") == 1
        participated_game_list.push(game_num)
      end
    end
    games = Game.where(id: participated_game_list)
    games.each do |game|
      assert_select "span", "vs"+game.opponent_name
      assert_select 'a[href=?]', game_path(game), text: "詳細"
      assert_select "span.average_score"
    end
  end
end
