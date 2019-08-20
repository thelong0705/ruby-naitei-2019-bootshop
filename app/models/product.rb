class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  resourcify

  selected_by :user
  validates :name, presence: true
  validates :price, presence: true,
            format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
            numericality: { greater_than: 0, less_than: 1000000 }

end
