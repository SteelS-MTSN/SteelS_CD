class Item < ApplicationRecord

	belongs_to :genre
	belongs_to :artist
	belongs_to :label


def self.ransackable_associations(*)
	%w[artists]
end

def count
	sum_stock_count = 0
	sum_order_count = 0

	stocks.each { |stock| sum_stock_count += stock.stock_count }
	orders.each { |order| sum_order_count += order.buy_quantity }

	sum_stock_count - sum_order_count
end



	has_many :reviews
	has_many :songs
	has_many :favorites
	has_many :carts
	has_many :users, through: :carts
	has_many :stocks
	has_many :orders
end
