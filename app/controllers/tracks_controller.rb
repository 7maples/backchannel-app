class TracksController < ApplicationController

  def show
    @track = ConferenceFetcher.get_track(params[:track_id])
    @messages = MessageFetcher.for_tracks(params[:track_id])
  end

end
