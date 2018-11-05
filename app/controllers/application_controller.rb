class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :require_login
    before_action :require_id

    def require_login

        unless logged_in?

          flash[:danger] = "Tu dois être enregistré pour accéder à cette page, petit malin ;)"

          redirect_to login_path # halts request cycle

        end
    end

    def require_id

      unless current_user.id.to_s == params[:id]
        flash[:danger] = "Tu dois être l'utilisateur pour accéder à cette page, petit malin ;)"

        redirect_to '/' # halts request cycle
      end

    end
end
