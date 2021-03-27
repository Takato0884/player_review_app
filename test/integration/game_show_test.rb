require 'test_helper'

class GameShowTest < ActionDispatch::IntegrationTest

  def setup
    @game1 = games(:one)
  end

  test "game_show display" do
    get game_path(@game1)
    assert_template "games/show"
    game_h1 = "名古屋グランパス"+" "+@game1.score_my.to_s+" vs "+
                        @game1.score_opponent.to_s+" "+@game1.opponent_name
    assert_select "h1", game_h1
    grampus_players = GrampusPlayer.where("game? = 1", @game1.id)
    assert_equal 1, grampus_players.count
    grampus_players.each do |grampus_player|
      assert_select "span", grampus_player.name
      # 疑問:minitestでセレクトボックスの内容までテストする方法
      assert_select "select#user_name"
      # 送信ボタンを確認するテストをここに追加予定
    end
  end
end
