class AddIndexToGrampusPlayersPlayerId < ActiveRecord::Migration[6.0]
  def change
    add_index :grampus_players, :player_id, unique: true
  end
end
