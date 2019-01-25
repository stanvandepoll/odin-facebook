class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) || current_user
  end

  def new
  end

  def edit
  end

  def incoming_requests
    @incoming_requests = FriendRequest.where(receiver_id: params[:id])
  end

  def posts
    @author = User.find(params[:id])
    @posts = @author.posts
  end
end
