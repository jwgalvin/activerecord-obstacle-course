class User < ApplicationRecord
  has_many :orders
  has_many :order_items, through: :orders
  has_many :items, through: :order_items

  def self.find_specific_names(array)
    where(name: array).order(name: :ASC).pluck(:name)
  end

  
end
