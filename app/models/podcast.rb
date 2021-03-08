class Podcast < ApplicationRecord
  belongs_to :mood

  has_many :reviews
  has_many :reviewers, source: :user, through: :reviews
  has_many :favorites
  has_many :favoriters, source: :user, through: :favorites

end
