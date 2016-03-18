class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:secret]

	def index
		@posts = Post.order(:created_at)
    	@categories = Category.all
    	@subcategories = Subcategory.all
	end
end