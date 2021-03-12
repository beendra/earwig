class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :podcast
  validates  :user_id, uniqueness: {scope: :podcast_id}
  def delete_faves
    @remove = @current_user.favorited_podcasts
    @remove.each do |r| 
      r.id
    end
  end

end
