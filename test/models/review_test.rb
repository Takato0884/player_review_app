require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  def setup
    @game = games(:one)
    @user = users(:michael)
    @grampus_player = grampus_players(:langerak)
    # @review = Review.new(score: "5", user_id: "1", grampus_player_id: "1", game_id: "1")
    @review = @game.reviews.build(score: "5", user_id: @user.id, grampus_player_id: @grampus_player.id)
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "user_id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end

  test "game_id should be present" do
    @review.game_id = nil
    assert_not @review.valid?
  end

  test "grampus_player_id should be present" do
    @review.grampus_player_id = nil
    assert_not @review.valid?
  end

  test "score should be present" do
    @review.score = nil
    assert_not @review.valid?
  end

  test "score should be any of [1-5]" do
    @review.score = 6
    assert_not @review.valid?
  end

end
