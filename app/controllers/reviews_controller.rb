class ReviewsController < ApplicationController

  def create
    @review = current_user.reviews.build(review_params)
    @review.game_id = params[:game_id]
    @review.grampus_player_id = params[:grampus_player_id]
    @grampus_player = GrampusPlayer.find(params[:grampus_player_id])
    if @review.save
      flash[:success] = "#{@grampus_player.name}のレビューを投稿しました"
      redirect_to game_path(params[:game_id])
    else
      flash[:danger] = "#{@grampus_player.name}の評価点が選択されていません"
      redirect_to game_path(params[:game_id])
    end
  end

  def destroy
  end

  private

    def review_params
      params.require(:review).permit(:score, :user_id, :game_id, :grampus_player_id)
    end
end
