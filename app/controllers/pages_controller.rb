class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:secret]

	def index
		@posts = Post.order(:title)
	end
end