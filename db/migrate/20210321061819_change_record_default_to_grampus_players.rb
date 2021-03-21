class ChangeRecordDefaultToGrampusPlayers < ActiveRecord::Migration[6.0]
  def change
    change_column :grampus_players, :game1, :integer, default: 0
    change_column :grampus_players, :game2, :integer, default: 0
    change_column :grampus_players, :game3, :integer, default: 0
    change_column :grampus_players, :game4, :integer, default: 0
    change_column :grampus_players, :game5, :integer, default: 0
  end
end
