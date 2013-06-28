# require 'spec_helper'
# ConferenceFetcher = Backchannel::Scheduler::Gem::ConferenceFetcher

# describe ConferenceFetcher do
#   describe '.get' do
#     context 'the conference name exists' do
#       it 'returns conference name' do
#         VCR.use_cassette('conference fetcher get conf') do
#           conference = ConferenceFetcher.get('ruby-conf-2011')
#           expect(conference['name']).to eq 'Ruby Conference 2011'
#         end
#       end
#     end

#     context 'the conference does not exists' do
#       it 'returns nil' do
#         VCR.use_cassette('conference fetcher get conf does not exist') do
#           conference = ConferenceFetcher.get('ruby-conf-nevah')
#           expect(conference).to be_nil
#         end
#       end
#     end
#   end
# end
