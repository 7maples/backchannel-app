require "spec_helper"

describe MessagesController do

  context "Posting a new message" do

    before do
      # @user.double('user', twitter_id: 23234)
      # controller.stub(:current_user).and_return(@user)
    end

    describe "with valid credentials" do
      it "should return a 201 status" do
        VCR.use_cassette('POST messages#create, valid request') do
          post :create, { body: "Hello people",
                          track_id: 1}

          expect(response.status).to eq 201
        end
      end
    end
  end
end
