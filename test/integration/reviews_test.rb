require 'test_helper'

class ReviewsTest < ActionDispatch::IntegrationTest

  def setup
    @other = users(:other)
    @michael = users(:michael)
  end

  test "create vaild review without login" do
    assert_no_difference "Review.count" do
      post reviews_path, params: { review: {score: 5},
                                    user_id: @other.id,
                                    game_id: 1,
                                    grampus_player_id: 1}
    end
  end

  test "create valid review with login" do
    log_in_as(@other)
    assert_difference "Review.count", 1 do
      post reviews_path, params: { review: {score: 5},
                                    user_id: @other.id,
                                    game_id: 1,
                                    grampus_player_id: 1}
    end
    follow_redirect!
    assert_template "games/show"
    assert_not flash.empty?
  end

  test "create invalid review with login" do
    log_in_as(@other)
    assert_no_difference "Review.count" do
      post reviews_path, params: { review: {score: "invalid"},
                                    user_id: @other.id,
                                    game_id: 1,
                                    grampus_player_id: 1}
    end
    follow_redirect!
    assert_template "games/show"
    assert_not flash.empty?
  end

  test "destroy review with correct_user" do
    log_in_as(@michael)
    review = reviews(:one)
    assert_difference "Review.count", -1 do
      delete review_path(review)
    end
    follow_redirect!
    assert_template "games/show"
    assert_not flash.empty?
  end

  test "destroy review with incorrect_user" do
    log_in_as(@other)
    review = reviews(:one)
    assert_no_difference "Review.count" do
      delete review_path(review)
    end
    follow_redirect!
    assert_template "static_pages/home"
  end

  test "destroy review without login" do
    review = reviews(:one)
    assert_no_difference "Review.count" do
      delete review_path(review)
    end
    follow_redirect!
    assert_template "sessions/new"
  end
end
