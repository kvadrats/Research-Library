require 'test_helper'

class BookmarksControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @update = {
  list: 'test number one',
    }
  end
  test "should create bookmark list" do
  	sign_in User.first
    assert_difference('Bookmark.count') do
      post :create, bookmark: @update
    end
  end

end
