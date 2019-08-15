class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :validatable, :confirmable

  def send_devise_notification notification, *args
    devise_mailer.send(notification, self, *args).deliver_later
  end

  selecting :product

  has_many :credit_cards, dependent: :destroy
  after_commit :assign_customer_id, on: :create

  def assign_customer_id
    customer = Stripe::Customer.create email: email
    self.customer_id = customer.id
  end
end
