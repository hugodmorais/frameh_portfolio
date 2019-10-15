class ApplicationController < ActionController::Base
    protect_from_forgery with: :reset_session
    include DeviseWhitelist

    before_action :set_source

    def set_source
        session[:source] = params[:q] if params[:q]
    end
end
