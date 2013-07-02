require 'spec_helper'

describe TrackShow do
  let(:user) { User.create!(name: 'name', nickname: 'nickname', image_url: 'image url', twitter_id: '123') }
  let(:view) { TrackShow.new(1, "reem-conf")}

  before do
    MessageFetcher.stub(for_tracks: [{'user_id' => user.id, 'body' => 'oh hai'}])
  end

  describe '#messages' do
    it 'returns messages with associated users in an openstruct' do
      User.stub(:where).and_return([user])

      message = view.messages.first

      expect(message.body).to eq 'oh hai'
      expect(message.user_name).to eq user.name
      expect(message.user_nickname).to eq user.nickname
      expect(message.user_image_url).to eq user.image_url
    end
  end

  describe '#users' do
    it "returns a hash of users associated with messages with user.id as key" do
      expect(view.users).to eq({user.id => user})
    end
  end

  describe '#track' do
    it "returns the requested track" do
      ConferenceFetcher.should_receive(:get_track).with(1)
      view.track
    end
  end

  describe '#conference_slug' do
    it "returns the conference_slug for the requested track" do
      expect(view.conference_slug).to eq "reem-conf"
    end
  end
end
