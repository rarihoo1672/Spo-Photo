class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :set_like, only: [:index, :show]
  before_action :likes_ranking, only: [:index]
  def index
    @spots = Spot.page(params[:page]).per(10).includes(:user)
    @hash = Gmaps4rails.build_markers(@spots) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
      marker.infowindow render_to_string( partial: "spots/infowindow",locals: {spot: spot} )
    end
  end

  def show
    @comment = Comment.new
    @hash = Gmaps4rails.build_markers(@spot) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
      marker.infowindow spot.name
    end
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to spot_path(@spot)
      flash[:notice] = "スポットを登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @spot.update(spot_params)
      redirect_to spot_path(@spot)
      flash[:notice] = "スポットを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @spot.destroy
    redirect_to root_path
    flash[:notice] = "スポットを削除しました"
  end

  private
  def spot_params
    params.require(:spot).permit(:name, :main_visual, :information, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def set_like
    @like = Like.new
  end

  def likes_ranking
    spot_like_count = Spot.joins(:likes).group(:spot_id).limit(5).count
    spot_liked_ids = Hash[spot_like_count.sort_by{ |_, v| -v }].keys
    @spot_ranking = Spot.where(id: spot_liked_ids)
  end
end
