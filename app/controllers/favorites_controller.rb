class FavoritesController < ApplicationController
	def create
		item = Item.find(params[:id])
		favorite = current_user.favorites.new(item_id: item.id)
	    favorite.save
	    redirect_to items_path
	end
	def destroy
	        item = Item.find(params[:id])
	        favorite = current_user.favorites.find_by(item_id: item.id)
	        favorite.destroy
	        redirect_to items_path
	end
end