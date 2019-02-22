class UsersController < ApplicationController
  before_action :require_login, only: [:index, :edit, :update]
  before_action :current_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def show
    binding.pry
    @user = User.find(params[:id])
    @films = Film.all
  end


private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end


      def require_login
        return head(:forbidden) unless session.include? :user_id
      end

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user == current_user
      end
end
