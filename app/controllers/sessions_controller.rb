class SessionsController < ApplicationController
  def create
    user = User.create_or_find_from_omniauth(env["omniauth.auth"])
    auto_login(user)

    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    logout
    redirect_to root_url, notice: "Signed out!"
  end
end
