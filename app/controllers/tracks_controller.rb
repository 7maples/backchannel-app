class TracksController < ApplicationController

  def show
    @messages = MessageFetcher.for_tracks(params[:track_id])
  end

end
