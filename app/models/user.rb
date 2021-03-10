class User < ApplicationRecord

    has_many :favorites
    has_many :favorited_podcasts, source: :podcast, through: :favorites
    has_many :reviews
    has_many :reviewed_podcasts, source: :podcast, through: :reviews
    has_many :likes
    has_many :liked_reviews, source: :review, through: :likes
    has_secure_password
    has_one_attached :image, :dependent => :destroy


    def favorited_podcast
        @favorite = self.favorites
        @favorite.map {|f| f.podcast}
    end

end
