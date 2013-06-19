require 'spec_helper'

describe "Chatting within a track's chat room" do
  it "Displays a chat when user submits message" do
    VCR.use_cassette('user submits message') do
      visit conference_track_path('ruby-conf-2011', 1)
      expect(current_path).to eq conference_track_path('ruby-conf-2011', 1)

      within "#Greeting" do
        expect(page).to have_content("Jen")
      end
    end
  end
end
