class OrdersController < ApplicationController

	def index
		@user = current_user
		@order_options = @user.order_option
	end

	def show
		@order_option = OrderOption.find(params[:id])
		@orders = @order_option.order
	end
end
