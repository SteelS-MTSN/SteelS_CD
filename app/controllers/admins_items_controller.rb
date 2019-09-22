class AdminsItemsController < ApplicationController
	before_action :authenticate_admin!
	autocomplete :artist, :name, :full => true

	def index
		@q = Item.ransack(params[:q])
		@items = @q.result(distinct: true)
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		@artist = Artist.find_by("name='#{item_params[:artist_id]}'")
		@item.artist_id = @artist.id
		@item.label_id = item_params[:label_id]
		@item.genre_id = item_params[:genre_id]
		@item.item_name = item_params[:item_name]
		@item.price = item_params[:price]
		@item.save!
		redirect_to admins_items_path
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@artist = Artist.find_by("name='#{item_params[:artist_id]}'")
		@item.artist_id = @artist.id
		@item.save!
		session[:item] = @item.id
		redirect_to new_admins_stock_path
	end

	private
  	def item_params
    	params.require(:item).permit(:artist_id, :item_name, :label_id, :genre_id, :price, :jacket)
  	end
end
