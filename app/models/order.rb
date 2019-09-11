class Order < ApplicationRecord
	belongs_to :item
	belongs_to :order_option
end
