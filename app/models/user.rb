class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :validatable, :confirmable

  def send_devise_notification notification, *args
    devise_mailer.send(notification, self, *args).deliver_later
  end

  selecting :product

  has_many :credit_cards, dependent: :destroy
end
