class ConferencesController < ApplicationController
  ConferenceFetcher = Backchannel::Scheduler::Gem::ConferenceFetcher
  before_filter :set_session, only: :show

  def show
    @conference = ConferenceFetcher.get(params[:conference])
    render :status => 404 if @conference.nil?
  end

  private

  def set_session
    session[:next_page] = conference_path(params[:conference])
  end
end
