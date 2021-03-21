require 'test_helper'

class GamesIndexTest < ActionDispatch::IntegrationTest

  test "index should include all games" do
    get games_path
    assert_template "games/index"
    games = Game.all
    assert_equal 3, Game.count
    games.each do |game|
      assert_select "span", game.opponent_name
      assert_select 'a[href=?]', game_path(game), text: "詳細"
    end
  end

end
