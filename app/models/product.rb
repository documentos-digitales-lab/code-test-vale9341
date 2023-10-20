class Product < ApplicationRecord
  belongs_to :customer
  validates_presence_of :quantity, :product, :unit_price
end
