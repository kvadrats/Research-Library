require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
		@subcategory = subcategories(:one)
    @user = users(:user)
    @subscriptions = @user.subcategories.all
  end

  test "should get subscribe for user" do
    sign_in @user
    assert_difference('@subscriptions.count', +1) do
      post :subscribe, id: @subcategory
    end
    assert_redirected_to subcategory_path(@subcategory)
  end

  test "should get unsubscribe for user" do
    sign_in @user
    post :subscribe, id: @subcategory
    assert_difference('@subscriptions.count', -1) do
      post :unsubscribe, id: @subcategory
    end
    assert_redirected_to subcategory_path(@subcategory)
  end

end
