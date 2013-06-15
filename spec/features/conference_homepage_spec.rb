require 'spec_helper'

describe 'Conference homepage' do
  describe 'visiting a conference that exists' do
    it 'renders the conference show view' do
      visit '/ruby-conf-2013'

      expect(page).to have_content 'Ruby Conference 2013'
    end
  end

  describe 'visiting a conference that does not exist' do
  end
end
