class AdminsOrdersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@order_options = OrderOption.all
	end

	def show
		@order_option = OrderOption.find(params[:id])
		@user = @order_option.user
		@items = Order.where(order_option_id: @order_option.id)
	end

	def update
		@order_option = OrderOption.find(params[:id])
		@order_option.update(order_option_params)
		redirect_to admins_order_path
	end

	def userorder
		@user = User.find(params[:id])
		@order_options = @user.order_option
	end

	private
  	def order_option_params
    	params.require(:order_option).permit(:delivery_status)
  	end
end
