class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new(:parent_id => params.permit(:parent_id)[:parent_id])
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
    @category.destroy
    redirect_to categories_url
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
