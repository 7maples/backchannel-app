class MessagesController < ApplicationController
  before_filter :require_login

  def create
    message = MessageFetcher.create_message(params.merge(user_id: current_user.id))

    if message
      render json: message, status: 201
    else
      render nothing: true, status: 404
    end
  end
end
