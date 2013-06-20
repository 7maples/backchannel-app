class MessagesController < ApplicationController

  def create
    params.merge!(user_id: current_user.id)
    result = MessageFetcher.create_message(params)
    render :nothing => true
  end
end
