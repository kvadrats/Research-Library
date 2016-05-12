require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @adminspost = posts(:one)
    @authorspost = posts(:two)
    @admin = users(:admin)
    @author = users(:author)
    @user = users(:user)
    @update = {
  title: 'test number one',
  description:'simple test'
    }
    @bookmark = bookmarks(:one)
  end

  test "should get index as authenticated" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "test should get index as guest" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)    
  end

  test "should get new as authenticated user" do
    sign_in User.first
    get :new
    assert_response :success
  end

  test "should create post as authenticated user" do
    sign_in User.first
    assert_difference('Post.count') do
      post :create, post: @update
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post for guest" do
    get :show, id: @authorspost
    assert_response :success
  end

  test "should show post for authorized user" do
    sign_in @user
    get :show, id: @authorspost
    assert_response :success
  end
  test "should get edit for admin" do
    sign_in @admin
    get :edit, id: @authorspost
    assert_response :success
  end

  test "should get edit for post as author" do
    sign_in @author
    get :edit, id: @authorspost
    assert_response :success
  end

  test "shouldn't get edit for guest" do
    get :edit, id: @authorspost
    assert_redirected_to new_user_session_path
  end

  test "shouldn't get edit as unaffiliated user" do
    sign_in @user
    get :edit, id: @authorspost
    assert_redirected_to root_path
  end

  test "should update post as admin" do
    sign_in @admin
    patch :update, id: @authorspost, post: @update
    assert_redirected_to post_path(assigns(:post))
  end

  test "should update post as post author" do
    sign_in @author
    patch :update, id: @authorspost, post: @update
    assert_redirected_to post_path(assigns(:post))    
  end

  test "shouldn't update post as guest" do
    patch :update, id: @authorspost, post: @update
    assert_redirected_to new_user_session_path
  end

  test "shouldn't update post as unaffiliated user" do
    sign_in @user
    patch :update, id: @authorspost, post: @update
    assert_redirected_to root_path
  end

  test "should destroy post as admin" do
    sign_in @admin
    assert_difference('Post.count', -1) do
      delete :destroy, id: @authorspost
    end
    assert_redirected_to root_path
  end

  test "should destroy post as post's author" do
    sign_in @author
    assert_difference('Post.count', -1) do
      delete :destroy, id: @authorspost
    end
    assert_redirected_to root_path
  end

  test "shouldn't destroy post as guest" do
    assert_difference('Post.count', 0) do
      delete :destroy, id: @authorspost
    end
    assert_redirected_to new_user_session_path
  end

  test "shouldn't destroy post as unaffiliated user" do
    sign_in @user
    assert_difference('Post.count', 0) do
      delete :destroy, id: @authorspost
    end
    assert_redirected_to root_path
  end
  test "should add to bookmarks as authorized user" do
    sign_in @admin
    assert_difference('Bookmark.count', +1) do
      get :show, id: @post
      @bookmark.save
    end
    assert_redirected_to bookmarks_path
  end

end
