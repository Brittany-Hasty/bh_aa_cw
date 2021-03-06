class Api::UsersController < ApplicationController
    
    skip_before_action :verify_authenticity_token

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            render json: ["success!"]
        else
            render json: {errors: 'invalid username or password'}
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
