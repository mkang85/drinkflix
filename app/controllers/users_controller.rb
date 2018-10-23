class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
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


private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
