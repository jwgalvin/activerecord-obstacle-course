class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  def self.id_search(array)
    Item.where(id: array).order(name: :asc)
  end


end
