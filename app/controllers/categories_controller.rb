class CategoriesController < ApplicationController
  def index
    @categories = Category.all #.map { |c| [c.name, c.id] }
    #@category = Category.new
    #@subcategory = Subcategory.new
    @subcategories = Subcategory.where("category_id = ?", Category.first.id)
  end

  def show
    #@category = Category.find(params[:id])
    @subcategory = Subcategory.where("id = ?", params[:id])
    #, params[:categorize][:subcategory_id]
  end

  def new
    @category = Category.new
    @subcategory = Subcategory.new
    @categories = Category.all.map { |category| [category.name, ccategory.id] }
    @subcategories = Subcategory.all.map { |s| [s.name, s.id, s.categories_id] }
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url
    else
      render :new
    end

    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
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
  def update_subcategories
    @subcategories = Subcategory.where("category_id = ?", params[:category_id])
    respond_to do |format|
      format.js
    end
  end

  def category_params
    #params.require(:category).permit(:name)
  end

  def subcategory_params
    #params.require(:subcategory).permit(:name, :category_id)
  end
end