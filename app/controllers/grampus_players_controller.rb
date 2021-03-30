class GrampusPlayersController < ApplicationController
  def index
    @players = GrampusPlayer.all
  end

  def show
    @player = GrampusPlayer.find(params[:id])
  end
end
