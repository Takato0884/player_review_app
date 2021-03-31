require 'test_helper'

class GameShowTest < ActionDispatch::IntegrationTest

  def setup
    @game1 = games(:one)
    @user = users(:michael)
  end

  test "game_show display with login" do
    log_in_as(@user)
    get game_path(@game1)
    assert_template "games/show"
    game_h1 = "名古屋グランパス"+" "+@game1.score_my.to_s+" vs "+
                        @game1.score_opponent.to_s+" "+@game1.opponent_name
    assert_select "h1", game_h1
    grampus_players = GrampusPlayer.where("game? = 1", @game1.id)
    assert_equal 2, grampus_players.count
    grampus_players.each do |grampus_player|
      assert_select "span", grampus_player.name
      assert_select 'a[href=?]', grampus_player_path(grampus_player), text: "詳細"
      assert_select "span.average_score"
    end
    # 2選手の内、片方はreview投稿済みで、もう片方はreview未投稿である
    assert_select "select#review_score", count: 1
    assert_select "form input[name=commit]", count: 1
    assert_select "span.reviewed_score", count: 1
  end

  test "game_show display without login" do
    get game_path(@game1)
    assert_template "games/show"
    game_h1 = "名古屋グランパス"+" "+@game1.score_my.to_s+" vs "+
                        @game1.score_opponent.to_s+" "+@game1.opponent_name
    assert_select "h1", game_h1
    grampus_players = GrampusPlayer.where("game? = 1", @game1.id)
    assert_equal 2, grampus_players.count
    grampus_players.each do |grampus_player|
      assert_select "span", grampus_player.name
      assert_select 'a[href=?]', grampus_player_path(grampus_player), text: "詳細"
      assert_select "span.average_score"
    end
    # ここより下のテストが重要
    assert_select "select#review_score", count: 0
    assert_select "form input[name=commit]", count: 0
    assert_select "span.reviewed_score", count: 0
  end


end
