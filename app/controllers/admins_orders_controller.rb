class AdminsOrdersController < ApplicationController
	def index
		@order_options = OrderOption.all
	end

	def show
		@order_option = OrderOption.find(params[:id])
		@items = @order.items
	end
end
