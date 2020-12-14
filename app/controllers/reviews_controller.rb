class ReviewsController < ApplicationController


    def new
        racket.find_by_id(params[:id])
        
    end

    def index

    end

end
