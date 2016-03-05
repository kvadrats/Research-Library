class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:secret]

	def index
		@posts = Post.order(:title)
    	@categories = Category.order(:name)
	end
end