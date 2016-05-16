require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

	def setup
		@admin = users(:admin)
    	@user = users(:user)
    	@category = categories(:one)
    	@update = {
    		name: 'newcat'
    	}
	end

	test "Admin should be able to view categories index path" do
		sign_in @admin
    	get :index
    	assert_response :success
    	assert_not_nil assigns(:categories)
	end

	test "User shouldn't be able to view categories index path" do
		sign_in @user
    	get :index
		assert_redirected_to root_path	
	end

	test "Guest shouldn't be able to view categories index path" do
    	get :index
		assert_redirected_to root_path	
	end

	test "Users shouldn't be able to create new category" do
		sign_in @user
    	assert_difference('Category.count', 0) do
      		post :create, category: @update
    	end
		assert_redirected_to root_path
	end

	test "Guest shouldn't be able to create new category" do
    	assert_difference('Category.count', 0) do
      		post :create, category: @update
    	end
		assert_redirected_to root_path
	end

	test "Admin should be able to create new category" do
		sign_in @admin
    	assert_difference('Category.count', +1) do
      		post :create, category: @update
    	end
		assert_redirected_to categories_path
	end

	test "Admin should be able to delete category" do
		sign_in @admin
    	assert_difference('Category.count', -1) do
   		   	delete :destroy, id: @category
     	end
		assert_redirected_to categories_path	
	end

	test "User shouldn't be able to delete category" do
		sign_in @user
    	assert_difference('Category.count', 0) do
   		   	delete :destroy, id: @category
     	end
		assert_redirected_to root_path

	end

	test "Guest shouldn't be able to delete category" do
    	assert_difference('Category.count', 0) do
   		   	delete :destroy, id: @category
     	end
		assert_redirected_to root_path
	end
end
