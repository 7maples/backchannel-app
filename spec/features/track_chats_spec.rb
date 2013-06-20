require 'spec_helper'

describe "Chatting within a track's chat room" do

  before do
    MessageFetcher.stub(:for_tracks).and_return('messages' => [{'id' => 1,
                                                                'body' => "yo",
                                                                'track_id' => 1,
                                                                'user_id' => 1,
                                                                'created_at' => Time.now,
                                                                'updated_at' => Time.now}])
  end

  it "Displays a chat when user submits message" do
    VCR.use_cassette('user submits message') do
      visit conference_track_path('ruby-conf-2011', 1)
      within ".chat" do
        expect(page).to have_content("yo")
      end
    end
  end

end
