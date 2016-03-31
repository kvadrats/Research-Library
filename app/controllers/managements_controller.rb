class ManagementsController < ApplicationController
	before_action :authenticate_user!
	def index

	end

	def submissions
		@posts = Post.all
	end
end
