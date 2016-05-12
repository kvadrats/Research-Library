require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index as authenticated" do
  	sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get index as guest" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end
end
