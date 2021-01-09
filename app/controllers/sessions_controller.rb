class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in

    def index

    end

    def new 

    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Sorry, log in unsuccessful.  Please try again."
            redirect_to login_path
        end
    end

    def omniauth_google
        @user = User.create_by_google(auth)

        session[:user_id] = @user.id
        redirect_to user_path(@user)

    end

    def omniauth_github
        @user = User.create_by_github(auth)

        session[:user_id] = @user.id
        redirect_to user_path(@user)

    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end