class User < ApplicationRecord

    has_many :favorites
    has_many :favorited_podcasts, source: :podcast, through: :favorites
    has_many :reviews
    has_many :reviewed_podcasts, source: :podcast, through: :reviews

    has_one_attached :image, :dependent => :destroy

end
