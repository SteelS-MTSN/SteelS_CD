class AdminsGenresController < ApplicationController
    before_action :authenticate_admin!
    PER = 8
    def index
    	@genre = Genre.new
        @search = Genre.ransack(params[:q])
        @results = @search.result
        @genres = @results.page(params[:page]).per(PER)
    end

    def create
    	@genre = Genre.new(genre_params)
    	@genre.save


    	redirect_to admins_genres_path
    	
    end

    def edit
        @genre = Genre.find(params[:id])
        
    end

    def update
        @genre = Genre.find(params[:id])
        @genre.update(genre_params)

        redirect_to admins_genres_path
        
    end
    def destroy
        @genre = Genre.find(params[:id])
        @genre.destroy

        redirect_to admins_genres_path
        
    end

    private
    def genre_params
        params.require(:genre).permit(:genre_name)
    end
end
