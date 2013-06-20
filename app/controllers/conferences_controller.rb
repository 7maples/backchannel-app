class ConferencesController < ApplicationController
  def show
    @conference = ConferenceFetcher.get(params[:conference])
    # raise @conference.inspect
    render :status => 404 if @conference.nil?
  end
end
