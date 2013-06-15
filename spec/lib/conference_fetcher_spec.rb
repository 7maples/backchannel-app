require 'spec_helper'

describe ConferenceFetcher do
  describe '.get' do
    context 'the conference name exists' do
      it 'returns conference name' do
        response = Typhoeus::Response.new(code: 200, body: '{"name" : "Ruby Conference 2013"}')
        Typhoeus.stub(/conferences/).and_return(response)

        conference = ConferenceFetcher.get('ruby-conf-2013')
        expect(conference.name).to eq 'Ruby Conference 2013'
      end
    end

    context 'the conference does not exists' do
      it 'returns nil' do
        response = Typhoeus::Response.new(code: 404)
        Typhoeus.stub(/conferences/).and_return(response)

        conference = ConferenceFetcher.get('ruby-conf-2013')
        expect(conference).to be_nil
      end
    end
  end
end
