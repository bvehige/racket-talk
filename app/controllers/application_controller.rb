class ApplicationController < ActionController::Base
    before_action :redirect_if_not_logged_in

helper_method :current_user, :logged_in?

# def route_not_found
#     render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
# end

    private

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

end
