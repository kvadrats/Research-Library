require 'test_helper'

class PostTest < ActiveSupport::TestCase

	def setup
		@post = Post.create(title: "Example Title", description: "lalalaalalalala")
	end

	test "should not save a post without title and description" do
		post = Post.new
		assert_not post.save
	end

	test "should not save a post with an existsting title" do
		duplicate_post = @post.dup
		assert_not duplicate_post.save
	end
end
