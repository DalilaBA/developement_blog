class PagesController < ApplicationController
    def home #home action
        redirect_to articles_path if logged_in?
    end

    def about #home action
    end
end
