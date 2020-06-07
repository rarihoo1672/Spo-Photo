class CommentsController < ApplicationController
  def create
    spot = Spot.find(params[:spot_id])
    @comment = spot.comments.build(comment_params)
    if @comment.save
      redirect_to spot_path(spot)
    else
      render :new
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end
end
