class User < ApplicationRecord

    has_many :favorites, dependent: :destroy
    has_many :favorited_podcasts, source: :podcast, through: :favorites
    has_many :reviews, dependent: :destroy
    has_many :reviewed_podcasts, source: :podcast, through: :reviews
    has_many :likes, dependent: :destroy
    has_many :liked_reviews, source: :review, through: :likes

    has_secure_password

    has_one_attached :image, :dependent => :destroy


    def my_faves
        @favorite = self.favorites
        @favorite.map {|f| f.podcast}
    end
    def reviewed 
        @reviewed = self.reviews
        # @reviewed.map {|r| r.content}

    end

end
