require "spec_helper"

describe QuestionsController do
  describe "POST #create" do
    context "as a logged-in user" do
      before do
        user = User.create!(twitter_id: '1', nickname: 'nick', name: 'nick', image_url: 'url')
        controller.stub(:current_user).and_return(user)
      end

      it "should return question and 201 status" do
        question_fetcher_response = {body: "Hello"}
        QuestionFetcher.stub(:create_question).and_return(question_fetcher_response)

        VCR.use_cassette('POST questions#create, valid request') do
          post :create, { body: "Why is the sky blue?",
                          track_id: 1}

          expect(response.status).to eq 201
          expect(response.body).to eq(question_fetcher_response.to_json)
        end
      end
    end

    describe "not logged in" do
      it "should redirect" do
        VCR.use_cassette('POST questions#create, invalid request') do
          post :create, { body: "WTF??",
                          track_id: 1}

          expect(response.status).to eq 302
        end
      end
    end
  end
end
