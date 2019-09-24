class AdminsStocksController < ApplicationController
	before_action :authenticate_admin!
	PER = 5

	def index
		@stocks = Stock.page(params[:page]).per(PER)
		@stocks = @stocks.order('id DESC')
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
