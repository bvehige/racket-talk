class ReviewsController < ApplicationController
    # before_action :redirect_if_not_logged_in

    def new
        if params[:racket_id] && Racket.find_by_id(params[:racket_id])
        @racket = Racket.find_by_id(params[:racket_id])
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
            # @reviews = @reviews.search(params[:query]) if params[:query].present?
        end

    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            @review.image.purge
            @review.image.attach(params[:review][:image])
        redirect_to review_path(@review)
        else
        render :new
        end

    end

    def show
        if Review.find_by_id(params[:id])
            @review = Review.find_by_id(params[:id])
        else
            redirect_to reviews_path
        end
         
    end

    def edit
        @review = Review.find_by_id(params[:id])

        if @review.user == current_user
            @review = Review.find_by_id(params[:id])
        else
            redirect_to review_path(@review)
            flash[:message] = "You can only edit your own reviews"
        end
    end

    def update
        @review = Review.find_by(id: params[:id])
    if @review.update(review_params)
        @review.image.purge
        @review.image.attach(params[:review][:image])
        redirect_to review_path(@review)
        
    else
        render :edit
    end

    def fivestars
        @reviews = Review.five_stars
    end


    end

    private

    def review_params
        params.require(:review).permit(:racket_id, :content, :stars, :title)
    end
end
