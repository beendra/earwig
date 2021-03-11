class Mood < ApplicationRecord
    has_many :podcasts, dependent: :destroy

    def podcast_title
        podcasts.map { |p| p.title } 
    end

end
