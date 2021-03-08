class Podcast < ApplicationRecord
  belongs_to :mood

  has_many :reviews
  has_many :reviewers, source: :user, through: :reviews
  has_many :favorites
  has_many :favoriters, source: :user, through: :favorites

  validates :length,presence: true, inclusion: { in: %w(Long Average Short), message: "%{value} must be Long, Average, or Short" }

  def show_mood
    s_moods = mood.feeling
  end

end
