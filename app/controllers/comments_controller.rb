class CommentsController < ApplicationController
  def create
    spot = Spot.find(params[:spot_id])
    @comment = spot.comments.build(comment_params)
    if @comment.save
      redirect_to spot_path(spot)
      flash[:notice] = "コメントをしました"
    else
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to spot_path(comment.spot_id)
    flash[:notice] = "コメントを削除しました"
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end
end
