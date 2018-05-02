class HomeController < ApplicationController
    def top
        if session[:user_id]
            redirect_to cards_path
        end
    end
end
