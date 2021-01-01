class RacketsController < ApplicationController
    before_action :set_racket, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in

    def index
        @rackets = Racket.order_by_rating
    end

    
    def new
        @racket = Racket.new
        @racket.build_brand
    end
       

    def create
        @racket = Racket.new(racket_params)
        @racket.user_id = session[:user_id]
        if @racket.save
            @racket.image.purge
            @racket.image.attach(params[:racket][:image])
            redirect_to racket_path(@racket)
        else
            @racket.build_brand
            render :new 
        end
    end

    def show
     
        #@racket = Racket.find(params[:id]) 
    end

    def edit
        #@racket = Racket.find_by(id: params[:id])
        
    end

    def update
        if @racket.update(racket_params)
            @racket.image.purge
            @racket.image.attach(params[:racket][:image])
            redirect_to racket_path(@racket)
        else
            render :edit
        end

    end


    private

    def racket_params
        params.require(:racket).permit(:racket_name, :description, :brand_id, brand_attributes: [:name])
    end

    def set_racket
        @racket = Racket.find_by(id: params[:id])
        redirect_to rackets_path if !@racket
    end

end
