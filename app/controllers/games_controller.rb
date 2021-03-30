class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @grampus_players = GrampusPlayer.where("game? = 1",@game.id)
    @review = current_user.reviews.build if logged_in?
  end

end
