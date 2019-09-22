class CartsController < ApplicationController
	before_action :check_stock, only:[:index]
	def create
		@cart = Cart.new(carts_params)
		current_items = Cart.where(user_id: current_user.id)

		is_exist = false

		current_items.each do |cart|
			if cart.item.id == @cart.item.id
				# 被ってる商品がある
				is_exist = true
				break
			end
		end

		if is_exist
			item = current_items.find_by(item_id: @cart.item_id)
			# 個数をふやす処理
			item.quantity += @cart.item.quantity
			item.save

		else
			cart.item_id = params[:item_id]
			@cart.user_id = current_user.id
			@cart.save
	    end
	end


	def index
		@user = current_user
		@carts = @user.carts
	end

	def update
		@cart = Cart.find(params[:id])
		@cart.update(carts_params)
		redirect_to carts_path
    end

	def buy_chose
		@user = current_user
		@carts = @user.carts
		@addresses = Address.where(user_id: @user.id)
	    @order_option = OrderOption.new
	end

	def buy_confirm
		@user = current_user
		@carts = @user.carts
		@to_address = order_option_params[:to_address]

		if @to_address != "current_address"
			@address = Address.find(@to_address.to_i)
		end

		@payment = OrderOption.convert_payment(order_option_params[:payment])
		@order_option = OrderOption.new
		render :buy_confirm
	end

	private
		def carts_params
			params.require(:cart).permit(:item_id ,:user_id, :quantity)
		end

		def order_option_params
		params.require(:order_option).permit(:payment, :to_address)
		end
		def check_stock

			current_user.carts.each do |cart|
				if cart.item.stock_count <= 0
					flash[:destroy] = "在庫がなくなった商品は削除されました。"
					cart.destroy
				end
			end
		end
	end

