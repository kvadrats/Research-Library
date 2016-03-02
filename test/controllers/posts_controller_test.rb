require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
    @update = {
  title: 'Something but actually nothing',
  description: 'There is actually nothing here, tis but a simple test',
  articlelink: 'http://america.aljazeera.com/articles/2015/3/17/clinical-trial-approved-for-mdma-psychotherapy.html',
  researchlink: 'http://america.aljazeera.com/articles/2015/3/17/clinical-trial-approved-for-mdma-psychotherapy.html',
  articleauth: 'Litte Timmy',
  researchauth: 'Big Jimmy',
  researchdate: '2016-05-02'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
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
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: @update
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
