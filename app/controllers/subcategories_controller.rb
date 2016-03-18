class SubcategoriesController < ApplicationController
	def new
		@subcategory = Subcategory.new
	end

	def create
		@subcategory = Subcategory.new(subcategory_params)

		if @subcategory.save
      		redirect_to categories_url
    	else
      		render :new
      	end
	end

  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id)
  end
end
