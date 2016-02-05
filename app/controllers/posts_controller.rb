class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def create
  	# @post = Post.new(params[:post])    
   #  @post.save
    Post.create post_params
    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :is_private)
  end

  # def post_params
  #   params.require(:post).permit(:title, :content, :is_private)
  # end
end
