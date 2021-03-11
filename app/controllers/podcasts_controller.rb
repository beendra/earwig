class PodcastsController < ApplicationController
    
    def index
        @podcasts = Podcast.all
    end
    
    def new
        @podcast = Podcast.new
        @moods = Mood.all
        @errors = flash[:errors]
    end

    def create 
        podcast = Podcast.create(podcast_params)
            if podcast.valid?
        redirect_to podcast_path(podcast)
            else 
                flash[:errors] = podcast.errors.full_messages
                redirect_to new_podcast_path
            end
    end

    def show
        @podcast = Podcast.find(params[:id])
        @s_moods = @podcast.show_mood
        #@add = current_user.add_fave
        
    end

    def edit
        @podcast = Podcast.find(params[:id])
        @moods = Mood.all
        @errors = flash[:errors]
    end
    
    def update
        @podcast = Podcast.find(params[:id])
        if @podcast.valid?
            @podcast.update(podcast_params)
            redirect_to podcast_path(@podcast)
        else 
            flash[:errors] = @podcast.errors.full_messages
            redirect_to edit_podcast_path
        end
    end

    # def favorite
    #     type = params[:type]
    #     if type == "favorite"
    #     current_user.favorites << @podcast
    #     redirect_to :back, notice: 'You favorited #{@podcast.name}'
    #     elsif type == "unfavorite"
    #     current_user.favorites.delete(@podcast)
    #     redirect_to :back, notice: 'Unfavorited #{@podcast.title}'
    #     else
    #     # Type missing, nothing happens
    #     redirect_to :back, notice: 'Nothing happened.'
    #     end
    # end
    

    private

    def podcast_params
        params.require(:podcast).permit(:title, :description, :length, :mood_id, :image)
    end 
    
end
