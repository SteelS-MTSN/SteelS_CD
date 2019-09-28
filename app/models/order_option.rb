class OrderOption < ApplicationRecord
	has_many :order

	belongs_to :user

	enum payment: { cash: 0, bank: 1 }
	# enum payment: [:代引き手数料250円, :振込]
	enum delivery_status: { prepare: 0, finish: 1 }

	def self.convert_payment(payment)
		I18n.t("enums.order_option.payment." << self.payments.keys[payment.to_i])
	end
end


