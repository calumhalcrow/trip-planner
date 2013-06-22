class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    redirect_to "/#/user/#{user._id}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
