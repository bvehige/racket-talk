class RacketsController < ApplicationController
    #before_action :set_racket, only:[:show, :edit, :update]
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
            redirect_to rackets_path
        else
            render :new 
        end
    end

    def show
        binding.pry

    end

    def edit

    end

    def update

    end


    private

    def racket_params
        params.require(:racket).permit(:racket_name, :description, :brand_id, brand_attributes: [:name])
    end

    # def set_racket
    #     @racket = Racket.find_by(params[:id])
    #     redirect_to rackets_path if !@racket
    #  end

end
