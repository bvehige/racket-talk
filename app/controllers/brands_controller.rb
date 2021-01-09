class BrandsController < ApplicationController
    before_action :redirect_if_not_logged_in

def index
    @brands = Brand.alphabetical
    
end

def show
    if Brand.find_by(id: params[:id])
        @brand = Brand.find_by(id: params[:id])
    else
        redirect_to brands_path
    end
    
end



end
