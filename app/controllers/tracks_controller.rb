class TracksController < ApplicationController

  before_filter :set_session, only: :show

  def show
    @track = ConferenceFetcher.get_track(params[:track_id])
    @conference_slug = params[:conference]
    @messages = MessageFetcher.for_tracks(params[:track_id])
  end

  private

  def set_session
    session[:next_page] = conference_track_path(params[:conference],
                                                params[:track_id])
  end

end
