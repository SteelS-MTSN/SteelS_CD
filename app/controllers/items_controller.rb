class ItemsController < ApplicationController
	Per = 6
	def index
		if params[:keyword].present?
			keyword =params[:keyword]
			@result = ::Item.joins(:artist).all
			like_keyword = "%#{keyword}%"
			@result = @result.where('items.item_name like ?',like_keyword).
			or(@result.where('artists.artist_name like ?',like_keyword)).order('items.item_name asc')
			@items = @result
		else
	 		@items = Item.all

	 	end
	 	# #違うテーブルで検索
	 	# @items = @search.result(distinct: true).includes(:artist).joins(:artist).page(params[:page]).per(6)
	 	# # 検索結果
	    # @items = @search.result
	end
	def show
	end
end
