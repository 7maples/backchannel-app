class ConferencesController < ApplicationController
  def show
    @conference = ConferenceFetcher.get(params[:conference])

    render :status => 404 if @conference.nil?
  end
end
