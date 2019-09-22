class Item < ApplicationRecord

	belongs_to :genre
	belongs_to :artist
	belongs_to :label


def self.ransackable_associations(*)
	%w[artists]
end

	has_many :reviews
	has_many :songs
	has_many :favorites
	has_many :carts
	has_many :stocks
	has_many :orders
	def favorited_by?(user)
   		favorites.where(user_id: user.id).exists?
    end
end
