class RegistrationsController < ApplicationController
    allow_unauthenticated_access only: %i[new create]
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "Registration successful!"
        redirect_to root_path
      else
        flash.now[:alert] = @user.errors.full_messages.join(", ")
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email_address, :password, :password_confirmation)
    end
  end