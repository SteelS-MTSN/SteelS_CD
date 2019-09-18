class OrderOption < ApplicationRecord
	has_many :order

	belongs_to :user

	enum delivery_status: [:発送準備中, :発送済み]
	enum payment: [:代引き手数料250円, :振込]
	enum payment: [:代引き, :銀行振込]
end
