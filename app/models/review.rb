class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :grampus_player
  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :grampus_player_id, presence: true
  VALID_EMAIL_REGEX = /[1-5]/i
  validates :score, presence:true, format: {with: VALID_EMAIL_REGEX}
end
