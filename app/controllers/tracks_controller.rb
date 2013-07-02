class TracksController < ApplicationController
  before_filter :set_session, only: :show

  def show
    @track_show = TrackShow.new(params[:track_id], params[:conference])
    gon.track_show = @track_show
  end

  private

  def set_session
    session[:next_page] = conference_track_path(params[:conference],
                                                params[:track_id])
  end
end
