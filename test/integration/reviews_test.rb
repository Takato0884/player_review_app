require 'test_helper'

class ReviewsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:other)
  end

  test "create vaild review without login" do
    assert_no_difference "Review.count" do
      post reviews_path, params: { review: {score: 5},
                                    user_id: @user.id,
                                    game_id: 1,
                                    grampus_player_id: 1}
    end
  end

  test "create valid review with login" do
    log_in_as(@user)
    assert_difference "Review.count", 1 do
      post reviews_path, params: { review: {score: 5},
                                    user_id: @user.id,
                                    game_id: 1,
                                    grampus_player_id: 1}
    end
    follow_redirect!
    assert_template "games/show"
    assert_not flash.empty?
  end

  test "create invalid review with login" do
    log_in_as(@user)
    assert_no_difference "Review.count" do
      post reviews_path, params: { review: {score: "invalid"},
                                    user_id: @user.id,
                                    game_id: 1,
                                    grampus_player_id: 1}
    end
    follow_redirect!
    assert_template "games/show"
    assert_not flash.empty?
  end

end
