class RacketsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @rackets = Racket.all
    end

    
    def new
     @racket = Racket.new
     @racket.build_brand
    end

    def create
        @racket = Racket.new(racket_params)
        @racket.user_id = session[:user_id]
        if @racket.save
            redirect_to racket_path(@racket)
        else
            render :new 
        end
    end

    def show
        @racket = Racket.find_by_id(params[:id])
    end


    private

    def racket_params
        params.require(:racket).permit(:racket_name, :description, :brand_id, brand_attributes: [:name])
    end

end
