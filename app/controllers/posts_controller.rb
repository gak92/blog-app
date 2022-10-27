class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.order(id: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
