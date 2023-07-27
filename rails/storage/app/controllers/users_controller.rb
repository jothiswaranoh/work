# app/controllers/users_controller.rb
class UsersController < ApplicationController
    def index
        @user = User.all
    end

    def new
        @user = User.new
    end
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to root_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :login, :avatar)
    end
  end
  