class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    # game_id = @game.id
    # @grampus_players = GrampusPlayer.where("game? = 1",game_id)
  end
end
