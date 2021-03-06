class SubscriptionsController < ApplicationController

  def submanagement
    @categories = Category.all
    @subcategories = Subcategory.all

    @subscribed = current_user.subcategories

  end

  def subscribe
    subcategory = Subcategory.find(params[:id])
    user = current_user

    user.subcategories << subcategory
    user.save
    redirect_to subcategory

  end

  def unsubscribe
    subcategory = Subcategory.find(params[:id])
    user = current_user

    user.subcategories.delete(subcategory)
    redirect_to subcategory
  end


end
