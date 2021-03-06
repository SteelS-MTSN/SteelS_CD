class CartsController < ApplicationController

	before_action :authenticate_user!
	before_action :check_stock, only:[:index, :update, :buy_chose, :buy_confirm]


	def create
		@cart = Cart.new(carts_params)
		current_carts = Cart.where(user_id: current_user.id)

		is_exist = false

		current_carts.each do |cart|
			if cart.item_id == @cart.item_id
				# 被ってる商品がある
				is_exist = true
				break
			end
		end

		if is_exist
			cart = current_carts.find_by(item_id: @cart.item_id)
			# 個数をふやす処理
			#binding.pry
			#cart.quantity.to_i
			quantity = cart.quantity.to_i
			quantity = quantity += 1
			cart.quantity = quantity
			cart.save!
			# item.quantity += @cart.item.quantity
			# item.save
			redirect_to carts_path

		else
			@cart.user_id = current_user.id
			@cart.save!
			redirect_to carts_path
	    end
	end


	def index
		@user = current_user
		@carts = @user.carts
	end

	def update
		@cart = Cart.find(params[:id])
		@cart.update!(carts_params)
		redirect_to carts_path
    end

    def destroy
    	cart = Cart.find(params[:id])
    	if cart.destroy
    		redirect_to carts_path
    	end
    end

	def buy_chose
		@user = current_user
		@carts = @user.carts
		if @carts.present?
			@addresses = Address.where(user_id: @user.id)
	    	@order_option = OrderOption.new
		else
			redirect_to items_path
		end
	end

	def buy_confirm
		@user = current_user
		@carts = @user.carts
		@order_option = OrderOption.new
		@order_option.to_address = order_option_params[:to_address]
		if @order_option.to_address != "current_address"
			@address = Address.find(@order_option.to_address.to_i)
		end

		@order_option.payment = order_option_params[:payment]
		render :buy_confirm
	end

	private

		def carts_params
			params.require(:cart).permit(:item_id, :quantity)
		end

		def order_option_params
		params.require(:order_option).permit(:payment, :to_address, :quantity)
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