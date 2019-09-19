class AdminsGenresController < ApplicationController
    before_action :authenticate_admin!

    def index
    	@genre = Genre.new
    	
    end

    def create
    	@genre = Genre.new(genre_params)
    	@genre.save

    	redirect_to admins_genre_index_path
    	
    end
end
