class Item < ApplicationRecord

	belongs_to :genre
	belongs_to :artist
	belongs_to :label




	has_many :review
	has_many :song
	has_many :favorite
	has_many :cart
	has_many :stock
	has_many :order
end
