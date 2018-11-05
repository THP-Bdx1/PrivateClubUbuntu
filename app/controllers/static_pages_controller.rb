class StaticPagesController < ApplicationController
    skip_before_action :require_login, only: [:home]
    skip_before_action :require_id, only: [:home, :index]
    def home
    end
    def index
        @users=User.all
    end
end
