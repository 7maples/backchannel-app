class MessagesController < ApplicationController

  def create
    # user_id will use the current_user.id once twitter auth is fixed
    params.merge!(user_id: 17)
    result = MessageFetcher.create_message(params)
    render :nothing => true
  end
end
