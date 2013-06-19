require 'spec_helper'

describe "Chatting within a track's chat room" do
  before do
    visit conference_path('rails-conf-2013')
  end

  it "Displays a chat when user submits message" do
    expect(current_path).to eq conference_path('rails-conf-2013')

    visit conference_track_path('rails-conf-2013', 1)
    expect(current_path).to eq conference_track_path('rails-conf-2013', 1)
    save_and_open_page
    within "#Greeting" do
      expect(page).to have_content("sam")
    end

    # fill_in "message_body", with: "The hashrocket is implied"
  end

end
