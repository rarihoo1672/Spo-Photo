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
      redirect_to root_path, notice: "登録しました"
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
end
