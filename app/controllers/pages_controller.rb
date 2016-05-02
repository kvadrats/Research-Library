class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:secret]

	def index
		if current_user != nil
			if current_user.subcategories.exists?
				@posts = Post.where(subcategory_id: current_user.subcategories.ids)
			else
				@posts = Post.order(:created_at)
			end
		else
			@posts = Post.order(:created_at)
		end
		@allcategories = Category.all
		@allsubcategories = Subcategory.all
	end

end
