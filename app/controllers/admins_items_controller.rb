class AdminsItemsController < ApplicationController
	autocomplete :artist, :name, :full => true

	def index
	end

	def edit
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
    	params.require(:item).permit(:artist_id, :item_name, :label_id, :genre_id, :price)
  	end
end
