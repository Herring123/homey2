class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = "Successfully Updated"
    else
      flash[:alert] = "Failed to update"
    end
    redirect_back(fallback_location: root_path)
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type, :user_id)
  end
end

