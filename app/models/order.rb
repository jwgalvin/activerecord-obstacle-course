class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items


  def self.find_user_3(id)
    #inding.pry
    where(user_id: id )
  end

  def self.sort_order_expensive
    order(amount: :DESC)
  end

  def self.sort_order_least_expensive
    order(amount: :ASC)
  end

  def sort_name_items
    items.order(name: :ASC)
  end


  def self.search_500
    where(amount: 500)
  end

  def self.search_200
    where(amount: 200)
  end

  def self.search_small
    #
    order(amount: :ASC).limit(1)
    .select(:id)
    .first
  end

  def self.search_big
    order(amount: :DESC).limit(1)
    .select(:id)
    .first
  end

  def self.big_search1
    where(amount: 500).or(where(amount: 700))
  end

  def self.big_search2
    where(amount: 700).or(where(amount: 1000))
  end

  def self.between_700_and_1000
    where(amount: (700..1000))
  end

  def self.order_id_search(array)
    where(id: array).order(id: :asc)
  end

  def self.less_550
    where("amount < ?", 550)
  end

  def self.find_names
     Order.joins(:items).pluck(:name)
  end
end
