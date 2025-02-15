class SessionsController < ApplicationController
    def new
    end
    def create
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: "You are now logged in."
      else
        flash.now.alert = "Incorrect email and/or password."
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: 'User has logged out.'
    end

  end