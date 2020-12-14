class ApplicationController < ActionController::Base

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user:id])
    end

end
