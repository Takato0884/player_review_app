class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.date :date
      t.string :opponent_name
      t.integer :score_my
      t.integer :score_opponent

      t.timestamps
    end
  end
end
