require 'spec_helper'

describe ConferencesController do
  describe 'GET #show' do
    context 'with a conference that exists' do
      before(:each) do
        response = Typhoeus::Response.new(code: 200, body: '{"name" : "Ruby Conference 2013"}')
        Typhoeus.stub(/conferences/).and_return(response)
      end

      it 'renders the show template' do
        get :show
        expect(response).to render_template(:show)
      end

      it 'assigns the conference correctly' do
        get :show, { :conference => 'ruby-conf-2013' }
        expect(assigns(:conference).name).to eq 'Ruby Conference 2013'
      end
    end

    context 'with a conference that does not exist' do
      it 'returns a 404 – not found' do
        get :show
        expect(response.status).to eq 404
      end
    end
  end
end
