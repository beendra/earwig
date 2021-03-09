class Mood < ApplicationRecord
    has_many :podcasts

    def podcast_title
        podcasts.map { |p| p.title } 
    end

end
