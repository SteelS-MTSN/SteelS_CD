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
			@allitems = Item.limit(5).order('id DESC')

		else
	 		@items = Item.all
	 		@items = Item.page(3).per(9)
	 		# ids = Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id)
	 		# binding.pry
	 		@allitems = Item.limit(5).order('id DESC')
	 		# @all_ranks = Item.find(ids)
	 		# binding.pry
	 		@item_favorites_count = Item.joins(:favorites).group(:id).count
	 		@item_favorites_ids = Hash[@item_favorites_count.sort_by{|_, v| -v }].keys
	 		@items = Item.where(id: @item_favorites_ids).page(params[:page]).per(9)
	 	end
	 	# #違うテーブルで検索
	 	# @items = @search.result(distinct: true).includes(:artist).joins(:artist).page(params[:page]).per(6)
	 	# # 検索結果
	    # @items = @search.result
	end

	def show
		@item = Item.find(params[:id])
		@songs = Song.where(item_id: @item.id)
		@reviews = Review.where(item_id: @item.id)
	end
end
