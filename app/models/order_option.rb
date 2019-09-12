class OrderOption < ApplicationRecord
	has_many :order


	belongs_to :user

	enum delivery_status: [:発送準備中, :発送済み]
end
