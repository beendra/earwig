class Review < ApplicationRecord
  belongs_to :user
  belongs_to :podcast

  def p_title
    podcast.title
  end

end
