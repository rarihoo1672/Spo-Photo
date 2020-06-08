class LikesController < ApplicationController
  before_action :set_tweet

  def create
    @like = Like.create(user_id: current_user.id, spot_id: @spot.id)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, spot_id: @spot.id)
    @like.destroy
  end

  private
    def set_tweet
      @spot = Spot.find(params[:spot_id])
    end
end
