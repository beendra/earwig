class ReviewsController < ApplicationController
    
    def new
        @review = Review.new
        @errors = flash[:errors]
    end

    def create 
        review = Review.create(review_params)
            if review.valid?
        redirect_to review_path(review)
            else 
                flash[:errors] = review.errors.full_messages
                redirect_to new_review_path
            end
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
        if @review.valid?
            @review.update(review_params)
            redirect_to review_path(@review)
        else 
            flash[:errors] = @review.errors.full_messages
            redirect_to edit_review_path
        end
    end
    

    private

    def review_params
        params.require(:review).permit(:content)
    end

end
