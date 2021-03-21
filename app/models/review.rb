class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :grampus_player
end
