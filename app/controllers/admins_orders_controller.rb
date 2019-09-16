class AdminsOrdersController < ApplicationController
	def index
		@order_options = OrderOption.all
	end

	def show
		@order_option = OrderOption.find(params[:id])
		@user = @order_option.user
		@items = Order.where(order_option_id: @order_option.id)
	end
end
