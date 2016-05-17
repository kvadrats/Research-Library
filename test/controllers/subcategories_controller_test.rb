require 'test_helper'

class SubcategoriesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
    setup do
      @subcategory = subcategories(:one)
      @admin = users(:admin)
      @user = users(:user)
      @update = {
  name: 'subofacat',
  category_id: Category.first.id
    }
    end

    test "should get show for guest users" do
      get :show, id: @subcategory
      assert_response :success
      assert_not_nil assigns(:posts)
    end

    test "should get show for authenticated users" do
      sign_in User.first
      get :show, id: @subcategory
      assert_response :success
      assert_not_nil assigns(:posts)
    end

    test "should create new subcategory as admin" do
      sign_in @admin
      assert_difference('Subcategory.count', +1) do
        post :create, subcategory: @update
      end
      assert_redirected_to categories_path
    end

    test "shouldn't create new subcategory as user" do
      sign_in @user
      assert_difference('Subcategory.count', 0) do
        post :create, subcategory: @update
      end
      assert_redirected_to root_path
    end

    test "shouldn't create new subcategory as guest" do 
      assert_difference('Subcategory.count', 0) do
        post :create, subcategory: @update
      end
      assert_redirected_to root_path
    end

    test "should destroy subcategory as admin" do
      sign_in @admin
      assert_difference('Subcategory.count', -1) do
        delete :destroy, id: @subcategory
      end
      assert_redirected_to categories_path
    end 

    test "shouldn't destroy subcategory as guest" do
      assert_difference('Subcategory.count', 0) do
        delete :destroy, id: @subcategory
      end
      assert_redirected_to root_path
    end

    test "shouldn't destroy subcategory as user" do
      sign_in @user
      assert_difference('Subcategory.count', 0) do
        delete :destroy, id: @subcategory
      end
      assert_redirected_to root_path
    end
end
