class CategoriesController < ApplicationController
  before_action :load_category
  
  def show
    @products = @category.products
  end
  
  def load_category
    @category = Category.find_by id: params[:id]
  
    return if @category
    flash[:warning] = t ".category_not_found"
    redirect_to root_url
  end
end
