class LikesController < ApplicationController
  def create
    current_user.likes.create(user_id: params[:user_id], 
                              post_id: params[:post_id])
    redirect_back(fallback_location: root_path, notice: "You liked the post")
  end
end
