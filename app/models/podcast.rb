class Podcast < ApplicationRecord
  belongs_to :mood

  has_many :reviews
  has_many :reviewers, source: :user, through: :reviews
  has_many :favorites
  has_many :favoriters, source: :user, through: :favorites

  validates :length,presence: true, inclusion: { in: %w(Long Average Short), message: "%{value} must be Long, Average, or Short" }

  has_one_attached :image, :dependent => :destroy

  def show_mood
    s_moods = mood.feeling
  end

#   def add_fave
#     @podcast = Podcast.find(1)
#     current_user.favorited_podcasts << @podcast
# end


end
