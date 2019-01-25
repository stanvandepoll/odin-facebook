class FriendRequestsController < ApplicationController
  def create
    other_user = User.find(params[:receiver_id])
    current_user.send_request(other_user)
    redirect_back(fallback_location: root_path, notice: "Sent friend request.")
  end

  def destroy
    if current_user.id != params[:id].to_i
      redirect_back(fallback_location: root_path, notice: "The request is not meant for the signed in user")
    else
      friend_request = FriendRequest.find_by_id(params[:request_id])
      friend_request.delete
      redirect_back(fallback_location: root_path, notice: "Friend request removed.")
    end
  end
end
