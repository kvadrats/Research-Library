require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  	setup do
	    @adminspost = posts(:one)
	    @authorspost = posts(:two)
    	@admin = users(:admin)
    	@author = users(:author)
    	@user = users(:user)
    	@adminscomment = comments(:one)
    	@authorscomment = comments(:two)
    	@nestedcomment = comments(:nestedtwo)
    	@update = {
    		comment: 'lalalalallaaa',
    		post_id: Post.first.id
    	}

  	end

	test "should get new comment as authenticated user" do
    	sign_in User.first
    	get :new, id: @adminspost.to_param
    	assert_response :success
	end

	test "shouldn't get new comment as guest" do
    	get :new
    	assert_redirected_to new_user_session_path
	end

	test "should create new comment as authenticated user" do
		sign_in @user
      	assert_difference('Comment.count', +1) do
			post :create, comment: @update
	    end
	    assert_redirected_to post_path(Post.first.id)
	end

	test "shouldn't create new comment as guest" do
      	assert_difference('Comment.count', 0) do
			post :create, comment: @update
	    end
	    assert_redirected_to new_user_session_path
	end

	test "should destroy comment as author of comment" do
		sign_in @author
		assert_difference('Comment.count', -1) do
			delete :destroy, id: @authorscomment
		end
		assert_redirected_to post_path(@authorspost)
	end

	test "shouldn't destory comment as somebody who is not the author" do
		sign_in @user
		assert_difference('Comment.count', 0) do
			delete :destroy, id: @authorscomment
		end
		assert_redirected_to root_path
	end

	test "should get edit as author of comment" do
		sign_in @author
		get :edit, id: @authorscomment
		assert_response :success
	end

	test "shouldn't get edit as not author of the comment" do
		sign_in @user
		get :edit, id: @authorscomment
		assert_redirected_to root_path
	end

	test "shouldn't get edit as guest" do
		get :edit, id: @authorscomment
		assert_redirected_to new_user_session_path	
	end
end
