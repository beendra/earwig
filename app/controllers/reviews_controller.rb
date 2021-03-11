class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end
    
    def new
        @review = Review.new
    end

    def create 
        @review = @ecurrent_user.reviews.create(review_params)
        #     if @review.valid?
        redirect_to reviews_path(@review)
            # else 
            #     flash[:errors] = @review.errors.full_messages
            #     redirect_to new_review_path
            # end
    end

    def show
        @review = Review.find(params[:id])
        @title = @review.p_title
    end

    def edit
        @review = Review.find(params[:id])
        @errors = flash[:errors]
    end
    
    def update
        @review = Review.find(params[:id])
        # if @review.valid?
        #     @review.update(review_params)
            redirect_to review_path(@review)
        # else 
        #     flash[:errors] = @review.errors.full_messages
        #     redirect_to edit_review_path
        # end
    end

    def like
        @review = Review.find(params[:id])
        Like.create(user_id: current_user.id, review_id: @review.id)
        return review_path(@review)
    end

    def destroy
        if !(like)
            flash[:notice] = "Cannot unlike"
        else
            like.destroy
        end
    end

    private

    def review_params
        params.require(:review).permit(:content,:user_id, :podcast_id)
    end

end
