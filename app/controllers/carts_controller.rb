class CartsController < ApplicationController
  before_action :load_product, only: :update

  def index; end

  def update
    if params[:btn_type] == "add"
      current_user.add_to_cart @product
    elsif params[:btn_type] == "remove"
      current_user.remove_from_cart @product
    end

    respond_to do |f|
      f.html {redirect_to :index}
      f.js
    end
  end

  private

  def load_product
    @product = Product.find_by id: params[:product_id]

    redirect_to main_app.root_path unless @product
  end
end
