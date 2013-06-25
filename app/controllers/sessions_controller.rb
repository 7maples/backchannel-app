class SessionsController < ApplicationController
  def create
    user = User.create_or_find_from_omniauth(env["omniauth.auth"])
    auto_login(user)

    redirect_to session[:next_page], notice: "Signed in!"
  end

  def destroy
    logout
    redirect_to :back, notice: "Signed out!"
  end
end
