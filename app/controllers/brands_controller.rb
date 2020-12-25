class BrandsController < ApplicationController
    before_action :redirect_if_not_logged_in

def index
    @brands = Brand.alphabetical
    
end

def show
   @brand = Brand.find_by(id: params[:id])

end



end
