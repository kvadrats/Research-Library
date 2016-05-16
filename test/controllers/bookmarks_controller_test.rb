require 'test_helper'

class BookmarksControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @admin = users(:admin)
    @author = users(:author)
    @user = users(:user)
  	@authorslist = bookmarks(:secondlist)
  	@adminslist = bookmarks(:firstlist)
    @update = {
  list: 'test number one',
    }
  end
  test "should get index if authorized" do 
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
    assert_not_nil assigns(:bookmarks)
  end

  test "shouldn't get index if unauthorized" do
  	get :index
    assert_redirected_to new_user_session_path
  end

  test "should create bookmark list" do
  	sign_in User.first
    assert_difference('Bookmark.count', +1) do
      post :create, bookmark: @update
    end
  end

  test "shouldn't create bookmark list as guest" do
  	assert_difference('Bookmark.count', 0) do
      post :create, bookmark: @update
    end
    assert_redirected_to new_user_session_path
  end

  test "should destroy own bookmark list with all bookmarks" do 
    sign_in @author
    assert_difference('Bookmark.count', -2) do
      delete :destroy, id: @authorslist
    end
    assert_redirected_to bookmarks_path
  end

  test "shouldn't destroy another users bookmark list" do
    sign_in @user
    assert_difference('Bookmark.count', 0) do
      delete :destroy, id: @authorslist
    end
    assert_redirected_to root_path
  end

  test "should be able to view posts in users own list" do 
  	sign_in @author
  	get :show, id: @authorslist
    assert_response :success
    assert_not_nil assigns(:posts)
    assert_not_nil assigns(:bookmarks)
  end

  test "shouldn't be able to view another users bookmarks" do 

  end

  test "shouldn't be able to create list for another user" do
  
  end
end
