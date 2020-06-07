class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @user_nickname = @spot.user.nickname
  end

  def new
    @spot = Spot.new
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
