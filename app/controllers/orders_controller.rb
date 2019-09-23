class OrdersController < ApplicationController
	PER = 10

	def index
		@user = current_user
		@order_options = @user.order_options
		@order_options = @user.order_options.page(params[:page]).per(PER)
	end

	def show
		@order_option = OrderOption.find(params[:id])
		@orders = @order_option.order
	end
end
