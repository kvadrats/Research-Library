class CategoriesController < ApplicationController
  before_action :verify_is_admin

  def index
    @categories = Category.all
    @subcategory = Subcategory.where("category_id = ?", Category.first.id)
    @subcategories = Subcategory.all
  end

  def show
    @category = Category.find(params[:id])
    @subcategory = Subcategory.new
    @subcategories = Subcategory.where("category_id = ?", Category.find(params[:id]))
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_url
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
      redirect_to categories_url
    end
  end

  private

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
