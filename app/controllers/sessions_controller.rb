class SessionsController < ApplicationController
  def new
  end

def create

    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
