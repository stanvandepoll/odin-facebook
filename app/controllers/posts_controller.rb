class PostsController < ApplicationController
  def index
    ids = current_user.friends.pluck(:id) << current_user.id
    @timeline = Post.where(user_id: ids).order(created_at: :desc)
  end
  
  def create
    current_user.posts.create(post_params)
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
