class CommentsController < ApplicationController
  def create
    
    Comment.create(user_id: params[:user_id],
                   post_id: params[:post_id],
                   content: params[:comment][:content])
    redirect_back(fallback_location: root_path, notice: "You submitted a comment")
  end
end
