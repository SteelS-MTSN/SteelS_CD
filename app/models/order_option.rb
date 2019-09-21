class OrderOption < ApplicationRecord
	has_many :order

	belongs_to :user

	enum payment: { cash: 0, bank: 1 }
	# enum payment: [:代引き手数料250円, :振込]
	# enum payment: [:発送準備中, :発送済]
end
