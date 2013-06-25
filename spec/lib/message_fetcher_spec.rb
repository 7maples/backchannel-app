require 'spec_helper'

describe MessageFetcher do
  describe '.for_tracks' do
    context 'track exists' do
      it 'returns a list of messages' do
        # VCR.use_cassette('message fetcher for tracks one message') do
        #   messages = MessageFetcher.for_tracks([1])
        #   expect(messages).to eq
        # end
      end
    end

    context 'track is unknown' do
      it 'returns an error' do
      end
    end
  end
end
