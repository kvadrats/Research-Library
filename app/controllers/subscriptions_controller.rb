class SubscriptionsController < ApplicationController

  def submanagement
    @categories = Category.all
    @subcategories = Subcategory.all
  end

  def subscribe
    subcategory = Subcategory.find(params[:id])
    user = current_user

    user.subcategories << subcategory
    user.save
    redirect_to :back

  end

  def unsubscribe
    subcategory = Subcategory.find(params[:id])
    user = current_user

    user.subcategories.delete(subcategory)
    redirect_to :back
  end


end
