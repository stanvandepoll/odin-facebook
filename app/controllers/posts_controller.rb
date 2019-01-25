class PostsController < ApplicationController
  def create
    current_user.posts.create(post_params)
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
