class FavoritesController < ApplicationController

    def new
        @favorite = Favorite.new
        @errors = flash[:errors]
    end

    def create 
        favorite = Favorite.create(favorite_params)
            if favorite.valid?
        redirect_to favorite_path(favorite)
            else 
                flash[:errors] = favorite.errors.full_messages
                redirect_to new_favorite_path
            end
    end

    def edit
        @favorite = Favorite.find(params[:id])
        @errors = flash[:errors]
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
    

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :podcast_id)
    end

end
