class BookmarksController < ApplicationController

  def index
  	@bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def new
	@bookmark = Bookmark.new
  end

  def add_post_to_bookmark

  	@bookmark = Bookmark.new(bookmark_params)
  	@bookmark.user_id = current_user.id

  	bookmark.save
  	redirect_to :back
  end

  def delete_post_from_bookmarks

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
