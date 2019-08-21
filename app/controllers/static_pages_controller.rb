class StaticPagesController < ApplicationController
  def index
    @q = Product.ransack params[:q]
    @products = @q.result.page(params[:page]).per(7)
  end
end
