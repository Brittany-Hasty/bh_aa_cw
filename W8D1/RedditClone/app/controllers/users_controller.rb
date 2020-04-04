class UsersController < ApplicationController
    before_action :require_signed_in!, only: [:index, :show]
    
    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            sign_in!(@user)
            redirect_to subs_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    # def edit
    #     @user = User.find(params[:id])
    #     render :edit
    # end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

    def require_is_user
        redirect_to user_url unless current_user.id ==params[:id].to_i
    end
end
