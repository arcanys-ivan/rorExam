class PostsController < ApplicationController
  def index
  	@posts = Post.new
  end

  def create
    Post.create post_params
    redirect_to :back
  end

  def edit
  	@post = Post.find params[:id]
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :is_private)
  end
end
