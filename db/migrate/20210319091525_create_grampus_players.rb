class CreateGrampusPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :grampus_players do |t|
      t.string :name
      t.integer :player_id

      t.timestamps
    end
  end
end
