class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.create(user_params)
    redirect_to new_user_path unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end



    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
