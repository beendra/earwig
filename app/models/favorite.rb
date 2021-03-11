class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :podcast

  def delete_faves
    @remove = @current_user.favorited_podcasts
    @remove.each do |r| 
      r.id
    end
  end

end
