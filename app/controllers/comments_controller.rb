class CommentsController < ApplicationController


  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def show
    @comments = Comment.where(post_id: params[:id])#.order(:created_at)
  end



  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(id: @comment.post_id)

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id, :ancestry, :parent_id)

  end

end
