class CommentsController < ApplicationController
  before_action :require_premission_comments ,only: [:edit, :destroy]
  before_action :user_signed_in?

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def show
    @comments = Comment.where(post_id: params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
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

private

  def require_premission_comments
    if current_user.id != Comment.find(params[:id]).user_id && current_user.admin == false
      redirect_to root_path
    end
  end
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id, :ancestry, :parent_id)

  end

end
