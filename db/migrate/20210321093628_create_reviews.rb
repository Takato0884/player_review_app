class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :score
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.references :grampus_player, null: false, foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:user_id, :game_id]
    add_index :reviews, [:grampus_player_id, :created_at]
  end
end
