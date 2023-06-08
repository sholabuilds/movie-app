module ApplicationHelper
    # current_user is used globally
    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end
end
