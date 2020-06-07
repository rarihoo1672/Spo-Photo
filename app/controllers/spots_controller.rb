class SpotsController < ApplicationController
  def index
  end

  def show
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
  end

  def destroy
  end

  private
  def spot_params
    params.require(:spot).permit(:name, :main_visual, :information, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end
end
