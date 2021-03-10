class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :podcast

  def favorited_podcast
    podcast.title
  end 

  def add_fave
    @podcast = Podcast.find(params[:id])
    @current_user.favorites << @podcasts
  end

end
