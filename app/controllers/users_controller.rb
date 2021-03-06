class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
    @user_likes = @user.liked_spots.page(params[:page]).per(7)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
      flash[:notice] = "プロフィールを編集しました"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar, :nickname, :introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
