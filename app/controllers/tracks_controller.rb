class TracksController < ApplicationController

  def show
    @track = ConferenceFetcher.get_track(params[:track_id])
    @conference_slug = params[:conference]
    @messages = MessageFetcher.for_tracks(params[:track_id])
  end

end
