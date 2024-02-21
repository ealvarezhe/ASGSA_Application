class ApplicationController < ActionController::Base
    include Pagy::Backend
    before_action :authenticate_member!
    
    include Pundit
    protect_from_forgery

    def pundit_user
        current_member
    end
end
