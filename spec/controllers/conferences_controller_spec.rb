require 'spec_helper'

describe ConferencesController do

  describe 'GET #show' do
    context 'with a conference that exists' do

      it 'assigns the conference correctly' do
        VCR.use_cassette('GET conf#show, conf exists') do
          get :show, { :conference => 'ruby-conf-2011' }
          expect(assigns(:conference)['name']).to eq 'Ruby Conference 2011'
        end
      end

    end

    context 'with a conference that does not exist' do
      it 'returns a 404, not found' do
        get :show, { :conference => 'reem-conf' }
        expect(response.status).to eq 404
      end
    end
  end

end
