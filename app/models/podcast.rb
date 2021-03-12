class Podcast < ApplicationRecord
  belongs_to :mood

  has_many :reviews, dependent: :destroy
  has_many :reviewers, source: :user, through: :reviews
  has_many :favorites, dependent: :destroy
  has_many :favoriters, source: :user, through: :favorites

  validates :length,presence: true, inclusion: { in: %w(Long Average Short), message: "%{value} must be Long, Average, or Short" }

  has_one_attached :image, :dependent => :destroy

  def show_mood
    s_moods = mood.feeling
  end

  def show_reviews #
    @show_review = self.reviews.map {|r| r.content}
  end

  def show_reviewers
    @show_reviewer = self.reviewers.map {|r| r.username}
  end

#   def add_fave
#     @podcast = Podcast.find(1)
#     current_user.favorited_podcasts << @podcast
# end


end
