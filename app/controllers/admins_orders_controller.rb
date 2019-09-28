class AdminsOrdersController < ApplicationController
	before_action :authenticate_admin!
	PER = 10

	def index
		@order_options = OrderOption.page(params[:page]).per(PER)
		@order_options = @order_options.order('id DESC')
	end

	def show
		@order_option = OrderOption.find(params[:id])
		@user = @order_option.user
		@items = Order.where(order_option_id: @order_option.id)
	end

	def update
		@order_option = OrderOption.find(params[:id])
		if @order_option.delivery_status == 'prepare'
			@order_option.delivery_day = Date.current
		else
			@order_option.delivery_day = nil
		end
		@order_option.update(order_option_params)
		redirect_to admins_order_path
	end

	def userorder
		@user = User.find(params[:id])
		@order_options = @user.order_options
		@order_options = @user.order_options.page(params[:page]).per(PER)
		@order_options = @order_options.order('id DESC')
	end

	private
  	def order_option_params
    	params.require(:order_option).permit(:delivery_status)
  	end
end
