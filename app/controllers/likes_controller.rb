class LikesController < ApplicationController

    before_action :find_like, only: [:destroy]

    def find_like
        @like = @review.likes.find(params[:id])
    end
    

end
