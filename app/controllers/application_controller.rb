class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :require_login
    before_action :require_id

    def require_login

        unless logged_in?

          flash[:danger] = "Alors, on essaie de tricher ? Tu cherches les ennuis ?"

          redirect_to login_path # halts request cycle

        end
    end

    def require_id

      unless current_user.id.to_s == params[:id]
        flash[:danger] = "Et si j'te pète les doigts t'essaieras encore d'aller sur une page qu'est pas la tienne ?"

        redirect_to '/' # halts request cycle
      end

    end
end
