class StaticPagesController < ApplicationController
  def index
    @q = Product.ransack name_cont: params[:q]
    @products = @q.result.page(params[:page]).per(7)
  end
end
