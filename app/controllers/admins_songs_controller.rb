class AdminsSongsController < ApplicationController
	def index
		@songs = Song.where(item_id: session[:item])
	end

	def new
		@song = Song.new
	end

	def create
	end

	def destroy
		@song = Song.find(params[:id])
		@song.destroy
		redirect_to songs_path
	end
end
