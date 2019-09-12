class OrdersController < ApplicationController

	def index
		@user = current_user
		@order_options = @user.order_options
		@order_options = @order_options.page(params[:page])
	end
	def show
		@orders = @order_option.orders
	end
end
