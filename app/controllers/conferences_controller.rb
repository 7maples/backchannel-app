class ConferencesController < ApplicationController
  before_filter :set_session

  def index
    render nothing: true
  end

  def show
    @conference = ConferenceFetcher.get_conference(params[:conference])
    @sessions_by_start_time = @conference['tracks'].map { |c| c['sessions'] }.flatten.compact.group_by { |s| s['start_time'] }
    render :status => 404 if @conference.nil?
    @tracks = @conference['tracks']
  end

  private

  def set_session
    session[:next_page] = conference_path(params[:conference])
  end
end
