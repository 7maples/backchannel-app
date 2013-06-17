class ConferencesController < ApplicationController
  def show
    # @conference = ConferenceFetcher.get(params[:conference])

    @conference = OpenStruct.new({ name: "RubyConf 2013",
                                   track_details: { track_id: 1,
                                   title: "Refactoring",
                                   description: "Talks about how to clean up your code",
                                   location: "Banquet Hall",
                                   session_details: { session_id: 1,
                                   title: "Refactoring Classes",
                                   description: "Make your classes leaner",
                                   topic_one: "Ruby",
                                   topic_two: "refactoring",
                                   topic_three: "DRY",
                                   speaker: "Katrina Owen",
                                   location: "Room 413" }}})

    render :status => 404 if @conference.nil?
  end
end
