class Api::V1::CommentsController < Api::V1::BaseController
  def show
    @comment = Comment.find(params[:id])
    render json: @comment, serializer: CommentSerializer
  end

  def create
  	@comment = Comment.new(comment_params)

  	if @comment.save
  		render json: @comment
  	end
  end

   private
    def comment_params
     params.require(:comment).permit(:post_id, :user_id, :message)
    end
end