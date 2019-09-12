class AdminsStocksController < ApplicationController
	def edit
		@stock = Stock.new
	end
	def create
		@stock = Stock.new
		@stock.save
		redirect_to admin_items_path
	end

	private
	def admin_stock_params
		params.require(:stock).permit(:stock_date, :stock_count, :trader, :trade_price)
end
