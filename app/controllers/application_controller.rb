class ApplicationController < ActionController::Base
    protect_from_forgery with: :reset_session
    include DeviseWhitelist
    include SetSource
    include CurrentUserConcern
end
