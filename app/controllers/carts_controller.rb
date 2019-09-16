class CartsController < ApplicationController

	def create
		@item = Item.find(params[:item_id])
		@cart = Cart.new
		@cart.save
	end

	def index
		@carts = Cart.where(user_id = current_user.id)
	end

	def buy_chose
		@carts = Cart.where(user_id = current_user.id)
		@adresses = Adress.where(user_id = current_user.id)
		@order_option = Order_option.new
	end

	private
		def carts_params
			params.require(:cart).permit(:item_id)
		end

end
