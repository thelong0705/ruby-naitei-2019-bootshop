class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    @products = Product.where(category: @product.category)
                  .where.not(id: @product.id)
    return if @product
    flash[:warning] = t ".product_not_found"
    redirect_to root_url
  end
end
