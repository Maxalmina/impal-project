class LandingPagesController < ApplicationController
    skip_before_action :require_login
    
    def index
    end

    def landing
    end
end
