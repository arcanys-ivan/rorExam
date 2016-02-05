class PostsController < ApplicationController
  def index
  	@post = Post.new
  	@posts = Post.all
  end

  def create
    Post.create post_params
    redirect_to :back
  end

  def edit
  	@post = Post.find params[:id]
  end

  def update
  	post = Post.find params[:id]
  	if post.update_attributes post_params
  	  redirect_to posts_path
  	else
  	  redirect_to :back
  	end
  end

  def destroy
  	Post.destroy params[:id]
  	redirect_to :back
  end 

  private

  def post_params
    params.require(:post).permit(:title, :content, :is_private)
  end
end
