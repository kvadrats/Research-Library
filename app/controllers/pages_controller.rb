class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:secret]

  def index
    @posts = Post.order(:created_at)
    @allcategories = Category.all
    @allsubcategories = Subcategory.all
  end

end
