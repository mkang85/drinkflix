require 'securerandom'
class SessionsController < ApplicationController
  def new
  end

def create
  if request.env['omniauth.auth']
   @user = User.find_or_create_by(id: auth['uid']) do |u|
     u.username = auth['info']['name']
     u.email = auth['info']['email']
   end
    @user.password = SecureRandom.hex
       @user.save
       session[:user_id] = @user.id
       redirect_to user_path(@user)
 else
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      redirect_to new_user_path
    end
  end
end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

private
  def auth
  request.env['omniauth.auth']
  end
end
