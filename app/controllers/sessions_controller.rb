class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    skip_before_action :require_id, only: [:new, :create, :destroy]
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          log_in user
          redirect_to '/'
        else
          flash.now[:danger] = "C'est non."
          render 'new'
        end
    end

    def destroy
        log_out
        redirect_to root_url
    end

end
