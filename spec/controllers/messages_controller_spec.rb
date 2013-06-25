require "spec_helper"

describe MessagesController do
  describe "POST #create" do
    context "as a logged-in user" do
      before do
        user = User.create!(twitter_id: '1', nickname: 'nick', name: 'nick', image_url: 'url')
        controller.stub(:current_user).and_return(user)
      end

      it "should return message and 201 status" do
        message_fetcher_response = {body: "Hello"}
        MessageFetcher.stub(:create_message).and_return(message_fetcher_response)

        VCR.use_cassette('POST messages#create, valid request') do
          post :create, { body: "Hello people",
                          track_id: 1}

          expect(response.status).to eq 201
          expect(response.body).to eq(message_fetcher_response.to_json)
        end
      end

      context 'message creation failed' do
        it "should return a 404 status" do
          VCR.use_cassette('POST messages#create missing params') do
            post :create, { body: "Hello people"}

            expect(response.status).to eq 404
          end
        end
      end
    end

    describe "not logged in" do
      it "should redirect" do
        VCR.use_cassette('POST messages#create, invalid request') do
          post :create, { body: "Hello people",
                          track_id: 1}

          expect(response.status).to eq 302
        end
      end
    end
  end
end
