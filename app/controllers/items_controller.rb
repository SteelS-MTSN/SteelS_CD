class ItemsController < ApplicationController
	PER = 9
	def index

   	    
        @search = Item.ransack(params[:q])
        @results = @search.result
        @item = @results.page(params[:page]).per(PER)
        @item = @item.order('id DESC')
		

			# @all_ranks = Item.find(1).artist.artist_name
			# binding.pry
			@allitems = Item.limit(5).order('id DESC')

			@allitems = Item.limit(5).order('id DESC')
	 		@item_favorites_count = Item.joins(:favorites).group(:id).count
	 		@item_favorites_ids = Hash[@item_favorites_count.sort_by{|_, v| -v }].keys
	 		@item_side = Item.where(id: @item_favorites_ids)


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
