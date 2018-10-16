class UsersController < ApplicationController
  def index
    binding.pry
    @users = User.all
  end

  def create
    @user = User.create(user_params)
      return redirect_to controller: 'users', action: 'new' unless @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
  end

  def show
    @user = User.find(session[:user_id])
  end



    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
