class AdminsSongsController < ApplicationController

	def new
		@song = Song.new
	end

	def show
		@songs = Song.where(item_id: params[:id])
		session[:item] = params[:id]
	end

	def create
		@song = Song.new(song_params)
		@song.item_id = session[:item]
		@song.save!
		redirect_to admins_song_path(session[:item])
	end

	def destroy
		@song = Song.find(params[:id])
		@song.destroy
		redirect_to admins_song_path(session[:item])
	end

	private
	def song_params
		params.require(:song).permit(:song_name, :disc_number, :track_number, :item_id)
	end
end
