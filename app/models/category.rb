class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  resourcify
end
