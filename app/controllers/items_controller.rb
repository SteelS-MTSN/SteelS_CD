class ItemsController < ApplicationController
	Per = 6
	def index
		# 検索
		if params[:keyword].present?
			keyword =params[:keyword]
			@result = ::Item.joins(:artist).all
			like_keyword = "%#{keyword}%"
			@result = @result.where('items.item_name like ?',like_keyword).
			or(@result.where('artists.artist_name like ?',like_keyword)).order('items.item_name asc')
			@items = @result
			# @all_ranks = Item.find(1).artist.artist_name
			# binding.pry
			@allitems = Item.all

		else
	 		@items = Item.all
	 		@items = Item.page(3).per(10)
	 		ids = Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id)
	 		# binding.pry
	 		# @all_ranks = Item.find(ids)
	 		@allitems = Item.all
	 	end
	 	# #違うテーブルで検索
	 	# @items = @search.result(distinct: true).includes(:artist).joins(:artist).page(params[:page]).per(6)
	 	# # 検索結果
	    # @items = @search.result
	end
	def show
	end
end
