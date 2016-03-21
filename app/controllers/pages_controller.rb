class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:secret]

	def index
		@posts = Post.order(:created_at)
    	@categories = Category.all
    	@subcategories = Subcategory.all
	end

	def show
		@posts = Post.order(:created_at)
	end
end