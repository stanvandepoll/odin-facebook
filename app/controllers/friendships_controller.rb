class FriendshipsController < ApplicationController
  def create
    if current_user.id != params[:friend_id].to_i
      redirect_back(fallback_location: root_path, notice: "The request is not meant for the signed in user")
    else
      friend_request = FriendRequest.find_by_id(params[:request_id])
      friend_request.delete
      friendship = Friendship.new(user_id: params[:user_id], friend_id: params[:friend_id])
      friendship.save
      redirect_back(fallback_location: root_path, notice: "You are now friends!")
    end
  end
end
