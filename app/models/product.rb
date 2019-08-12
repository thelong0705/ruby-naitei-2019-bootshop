class Product < ApplicationRecord
  resourcify

  selected_by :user
end
