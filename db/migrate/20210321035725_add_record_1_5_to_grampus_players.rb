class AddRecord15ToGrampusPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :grampus_players, :game1, :integer
    add_column :grampus_players, :game2, :integer
    add_column :grampus_players, :game3, :integer
    add_column :grampus_players, :game4, :integer
    add_column :grampus_players, :game5, :integer
  end
end
