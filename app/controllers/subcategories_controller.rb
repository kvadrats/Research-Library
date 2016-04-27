class SubcategoriesController < ApplicationController
  before_action :verify_is_admin, only: [:create, :new, :destroy, :edit]

  def new
    @subcategory = Subcategory.new
  end

  def show
    @subcategory = Subcategory.find(params[:id])
    @posts = Post.all.where("subcategory_id = ?", params[:id])
    @allcategories = Category.all
    @allsubcategories = Subcategory.all
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)

    if @subcategory.save
      redirect_to :back
    else
      render :new
    end

  end

  def destroy
    @subcategory = Subcategory.find(params[:id])

    @subcategory.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'Subcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end

  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id)
  end
end
