require 'test_helper'

class ReviewsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  # test "combination of [:user_id, :game_id, :grampus_player_id] should be unique" do
  #
  #   assert_no_difference "Review.count" do
  #     log_in_as(@user)
  #     post reviews_path, params: { review: {score: 5},
  #                                   user_id: @user.id,
  #                                   game_id: 1,
  #                                   grampus_player_id: 1}
  #   end
  # end
end
