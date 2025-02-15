
class UsersController < ApplicationController
    def new
      @user = User.new
    end 
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path, notice: "New user created!"
      else
        redirect_to "/"
      end
    end
 
    private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_digest
      )
    end
  end