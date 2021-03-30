class AddUniqueToReviews < ActiveRecord::Migration[6.0]
  def change
    add_index :reviews, [:user_id, :game_id, :grampus_player_id], unique: true
  end
end
