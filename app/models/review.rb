class Review < ApplicationRecord
  belongs_to :user
  belongs_to :podcast

  has_many :likes
  has_many :user_likes, source: :user, through: :likes

  def p_title
    podcast.title
  end

  def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
  end

end
