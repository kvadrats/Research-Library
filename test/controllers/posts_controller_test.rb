require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @post = posts(:one)
    @update = {
  title: 'test number one',
  description:'simple test'
    }
  end

  test "should get index" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    sign_in User.first
    get :new
    assert_response :success
  end

  test "should create post" do
    sign_in User.first
    assert_difference('Post.count') do
      post :create, post: @update
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    sign_in User.first
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    sign_in User.first
    patch :update, id: @post, post: @update
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    sign_in User.first
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_redirected_to root_path
  end
end
