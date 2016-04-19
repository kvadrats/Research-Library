class CommentsController < ApplicationController

	def create
	@comment = Comment.new(comment_params)
	@post = Post.find(@comment.post_id)

      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        render :new
      end
	end


	def comment_params
		params.require(:comment).permit(:comment, :user_id, :post_id)

	end
end
