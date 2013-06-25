class UsersController < ApplicationController
  def show
    render json: User.find(params[:id])
  end

  def destroy
    #delete from db
  end
end
