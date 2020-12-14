class ReviewsController < ApplicationController

    def new
        @racket = Racket.find_by_id(params[:racket_id])
        @review = @racket.reviews.build

    end

    def index

    end

    def create
        @review = Review.new(review_params)
        if @review.save
        redirect_to review_path(@review)
        else
        render :new
        end
        
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:racket_id, :content, :stars, :title)
    end
end
