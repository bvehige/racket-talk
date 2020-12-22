class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if @racket = Racket.find_by_id(params[:racket_id])
        @review = @racket.reviews.build
        else
        @review = Review.new
    end
        
    end

    def index
        #if it's nested
        if params[:racket_id] && Racket.find_by_id(params[:racket_id])
            @racket = Racket.find_by_id(params[:racket_id])
            @reviews = @racket.reviews
        else
        #if it's not nested
            @reviews = Review.all
        end

    end

    def create
        @review = current_user.reviews.build(review_params)
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
