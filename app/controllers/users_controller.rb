class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    skip_before_action :require_id, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Bienvenu sur notre super app!"
            redirect_to '/'
          else
            render 'new'
        end
    end

    def show
        @user = User.find(current_user.id)
    end

    def edit
       @user = User.find(params[:id])
    end

    def update
        if User.find(current_user.id).update(user_params)
            flash[:success] = "Modifications faites"
            redirect_to '/'
        else
            flash.now[:danger] = "Modifications non valides"
            render 'edit'
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end



end
