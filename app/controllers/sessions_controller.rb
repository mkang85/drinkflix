class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['username']
      u.email = auth['info']['email']
    end

    session[:user_id] = @user.id

    render 'users/index'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
