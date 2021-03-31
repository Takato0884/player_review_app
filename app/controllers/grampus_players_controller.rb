class GrampusPlayersController < ApplicationController
  def index
    @players = GrampusPlayer.all
  end

  def show
    @player = GrampusPlayer.find(params[:id])
    game_count = Game.count
    game_nums = Range.new(1,game_count)
    participated_game_list = []
    game_nums.each do |game_num|
      if @player.send("game#{game_num}") == 1
        participated_game_list.push(game_num)
      end
    end
    @games = Game.where(id: participated_game_list)
  end
end
