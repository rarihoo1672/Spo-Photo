class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index
    @spots = Spot.all.includes(:user)
    @hash = Gmaps4rails.build_markers(@spots) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
      marker.infowindow render_to_string( partial: "spots/infowindow",locals: {spot:spot} )
    end
  end

  def show
    @hash = Gmaps4rails.build_markers(@spot) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
      marker.infowindow spot.name
    end
  end

  def new
    @spot = Spot.new
    @comment = Comment.new
  end

  def create
    spot = Spot.new(spot_params)
    if spot.save
      redirect_to spot_path(spot), notice: "登録しました"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @spot.update(spot_params)
      redirect_to spot_path(@spot), notice: "登録しました"
    else
      render :edit
    end
  end

  def destroy
    @spot.destroy
    redirect_to root_path, notice: "削除しました"
  end

  private
  def spot_params
    params.require(:spot).permit(:name, :main_visual, :information, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
