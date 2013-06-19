require 'spec_helper'

describe 'Conference homepage' do
  describe 'visiting a conference that exists' do
    it 'renders the conference show view' do
      VCR.use_cassette('conf homepage that exists') do
        visit conference_path('ruby-conf-2011')
        expect(page).to have_content 'Ruby Conference 2011'
      end
    end
  end

  describe 'visiting a conference that does not exist' do
  end
end
