class CommentsController < ApplicationController
  before_action :logged_in
  before_action :require_permission_comments ,only: [:edit, :destroy]

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def show
    @comments = Comment.where(post_id: params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    @post = Post.find_by(id: @comment.post_id)
    
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Comment was successfully updated'
    else
      render :new
    end
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
    @post = @comment.post
    @comment.destroy
    redirect_to @post
  end

private

  def require_permission_comments
    if current_user.id != Comment.find(params[:id]).user_id && current_user.admin == false
      redirect_to root_path
    end
  end
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id, :ancestry, :parent_id)

  end

end
