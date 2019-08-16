class CartsController < ApplicationController
  before_action :load_product, only: %i(update destroy)

  def index; end

  def update
    if params[:btn_type] == "add"
      product_qty = params[:product_qty].to_i

      current_user.add_multiple_to_cart @product, product_qty
    elsif params[:btn_type] == "remove"
      current_user.remove_from_cart @product
    end

    respond_to do |f|
      f.html {redirect_to :index}
      f.js
    end
  end

  def destroy
    item = Cart.find_by user_id: current_user.id, product_id: @product.id

    if item.destroy
      respond_to do |f|
        f.html {redirect_to :index}
        f.js
      end
    else
      flash[:notice] = t ".fail_to_delete_item"
    end
  end

  private

  def load_product
    @product = Product.find_by id: params[:product_id]

    redirect_to main_app.root_path unless @product
  end
end
