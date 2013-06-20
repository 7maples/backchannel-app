class MessagesController < ApplicationController

  def create
    # user_id will use the current_user.id once twitter auth is fixed
    data = {
      body:     params[:body],
      track_id: params[:track_id],
      user_id:  17
    }
    response = MessageFetcher.create_message(data)
    render :nothing => true
  end
end
