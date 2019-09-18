class AdminsStocksController < ApplicationController
	def index
		@stocks = Stock.all
	end

	def new
		@stock = Stock.new
	end

	def create
		@stock = Stock.new
		@stock.save
		redirect_to admins_stocks_path
	end

	private
	def admin_stock_params
		params.require(:stock).permit(:stock_date, :stock_count, :trader, :trade_price)
	end
end
