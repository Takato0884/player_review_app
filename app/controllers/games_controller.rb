class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @user = User.new
    @game = Game.find(params[:id])
    # @grampus_players = GrampusPlayer.all
    game_id = @game.id
    @grampus_players = GrampusPlayer.where("game? = 1",game_id)
  end
end
