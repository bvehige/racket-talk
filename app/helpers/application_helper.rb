module ApplicationHelper

    def navbar
        if logged_in?
            render partial: 'layouts/loggedin_links'
        else
            render partial: 'layouts/loggedout_links'
        end
    end

    # def logged_in_as
    #     if logged_in?
    #     content_tag ("Logged in as #{current_user.username}")
    #     end
    # end

end
