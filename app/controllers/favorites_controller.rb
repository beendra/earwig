class FavoritesController < ApplicationController

    def index
        @favorites = Favorite.all
    end

    def new
        @favorite = Favorite.new
        @errors = flash[:errors]
    end

    def create 
        # @podcast = Podcast.find(params[:id])
        favorite = Favorite.create(favorite_params)
        redirect_to user_path(@current_user)
    end

    def edit
        @favorite = Favorite.find(params[:id])
        @errors = flash[:errors]
        @bye = @current_user.remove
    end
    
    def update
        @favorite = Favorite.find(params[:id])
        if @favorite.valid?
            current_user.favorites << @favorite
            @favorite.update(favorite_params)
            redirect_to favorite_path(@favorite)
        else 
            flash[:errors] = @favorite.errors.full_messages
            redirect_to edit_favorite_path
        end
    end
    
    def destroy 
        favorite = Favorite.find(params[:id])
        favorite.destroy
        redirect_to edit_favorite_path
    end

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :podcast_id)
    end

end
