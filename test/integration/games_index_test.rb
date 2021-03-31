require 'test_helper'

class GamesIndexTest < ActionDispatch::IntegrationTest

  test "index should include all games" do
    get games_path
    assert_template "games/index"
    games = Game.all
    games.each do |game|
      # 疑問:どうすれば日付をテストできるか
      # 参考:「rails c」でgame.dateを調べると「Sun, 28 Feb 2021」と表示されてしまう
      assert_select "span", game.opponent_name
      assert_select "span.score_my", game.score_my.to_s
      assert_select "span.score_opponent", game.score_opponent.to_s
      assert_select 'a[href=?]', game_path(game), text: "詳細"
    end
  end

end
