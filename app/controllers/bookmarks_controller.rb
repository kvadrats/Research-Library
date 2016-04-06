class BookmarksController < ApplicationController

  def index
  	@lists = Bookmark.where(user_id: current_user.id).where(post_id: nil)
  end

  def new
	@bookmark = Bookmark.new
  end

  def destroy
  	@list = Bookmark.find(params[:id])
  	@bookmarks = Bookmark.where(:list => @list.list)

    if @bookmarks.destroy_all
    	redirect_to bookmarks_url
    end
  end

  def show
  	@lists = Bookmark.where(user_id: current_user.id).where(post_id: nil)
    @list = Bookmark.find(params[:id])
    @bookmarks = Bookmark.where.not(post_id: nil).where(list: @list.list)
    @posts = Post.where(:id => @bookmarks.map(&:post_id))
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to bookmarks_url
    else
      render :new
    end
  end

  def bookmark_params
  	params.require(:bookmark).permit(:list, :user_id, :post_id)
  end

end
