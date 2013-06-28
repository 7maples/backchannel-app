class ConferencesController < ApplicationController
  before_filter :set_session

  def index
    render nothing: true
  end

  def show
    @conference = ConferenceFetcher.get_conference(params[:conference])
    render :status => 404 if @conference.nil?
  end

  private

  def set_session
    session[:next_page] = conference_path(params[:conference])
  end
end
