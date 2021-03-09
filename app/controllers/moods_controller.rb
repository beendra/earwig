class MoodsController < ApplicationController
    
    def index
        @moods = Mood.all
        end
    
    def show
        @mood = Mood.find(params[:id])
        @podcasts = @mood.podcast_title
    end

end
