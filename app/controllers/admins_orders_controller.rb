class AdminsOrdersController < ApplicationController
	def index
		@order_options = @order_options.page(params[:page])
	end

	def show
		@order_option = Order_option.find(params[:id])
		@orders = @order_option.orders
	end
end
