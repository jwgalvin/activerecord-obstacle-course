class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  def self.id_search(array)
    Item.where(id: array).order(name: :asc)
  end

  def get_ids(array_objects)
    ids = []
    get_ids = array_objects.each do |object|
      ids << object.id
    end
    ids
  end

 def self.exclusionary(search_array)
   ids = []
   get_ids = search_array.each do |object|
     ids << object.id
   end

   Item.where.not(id: ids)
 end
end
