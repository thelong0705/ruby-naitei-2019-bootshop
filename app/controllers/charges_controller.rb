class ChargesController < ApplicationController
  before_action :authenticate_user!

  rescue_from Stripe::CardError do |e|
    redirect_to main_app.root_path, alert: e.message
  end

  def create
    StripeChargesService.new(charges_params, current_user).call
    current_user.carts.each do |c|
      Bill.create(
        product: c.product,
        user: current_user,
        quantity: c.quantity)
    end
    Cart.where(user_id: current_user.id).delete_all
    flash[:info] = t ".succeed_in_payment"
    redirect_to main_app.carts_path
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken)
  end
end
