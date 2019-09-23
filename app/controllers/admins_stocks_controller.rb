class AdminsStocksController < ApplicationController
	before_action :authenticate_admin!
	def index
		@stocks = Stock.all
	end

	def new
		@stock = Stock.new
	end

	def create
		@stock = Stock.new(stock_params)
		@stock.item_id = session[:item]
		@stock.save!
		session[:item] = nil
		redirect_to admins_items_path
	end

	def edit
		@stock = Stock.new
		session[:item] = params[:id]
	end

	private
	def stock_params
		params.require(:stock).permit(:stock_date, :stock_count, :trader, :trade_price, :item_id)
	end
end
