class OrderOptionsController < ApplicationController

	def create
		@order_option = OrderOption.new(payment:params[:order_option][:payment].to_i,to_post_code: params[:order_option][:to_post_code],to_address: params[:order_option][:to_address],to_name: params[:order_option][:to_name],to_kana: params[:order_option][:to_kana])
		@order_option.total_price = cart_total_price(current_user)
		@order_option.user_id = current_user.id

		@order_option.save

		@carts = current_user.carts
		@carts.each do |cart|
			order = Order.new
			order.item_id = cart.item_id
			order.past_price = cart.item.price
			order.buy_quantity = cart.quantity
			order.order_option_id = @order_option.id
			order.save
		end
		redirect_to items_path
	end


	private
	def order_option_params
		params.require(:order_option).permit(:payment, :to_address, :to_post_code)
	end
	def order_params
		params.require(:order).permit(:order_option_id, :past_price, :buy_quantity)
	end


	def cart_total_price(current_user)
		sum = 0
		cart_items = current_user.carts

		cart_items.each do |cart|
			sum = sum + cart.item.price * cart.quantity.to_i
		end
		return sum
	end
end
