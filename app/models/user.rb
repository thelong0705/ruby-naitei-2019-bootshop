class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable
  
  def send_devise_notification notification, *args
    devise_mailer.send(notification, self, *args).deliver_later
  end
  
  selecting :product
  
  has_many :credit_cards, dependent: :destroy
  has_many :bills, dependent: :destroy
  after_commit :assign_customer_id, on: :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: true
  
  def total_cart_costs
    self.carts.
      inject(0) {|result, cart| result + cart.product.price * cart.quantity}
  end
end
