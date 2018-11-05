class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    skip_before_action :require_id, only: [:new, :create, :show]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Bongeoure !"
            redirect_to '/'
          else
            render 'new'
        end
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
       @user = User.find(params[:id])
    end

    def update
        if User.find(current_user.id).update(user_params)
            flash[:success] = "Ton profil a été modifié !"
            redirect_to '/'
        else
            flash.now[:danger] = "C'est non"
            render 'edit'
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end



end
