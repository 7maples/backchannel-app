require 'spec_helper'

describe 'log in user with twitter' do

  it "allows existing user to log in via twitter" do
    visit root_path
    mock_auth_hash # OmniauthMockHelper.mock_auth_hash
    click_link "Sign in with Twitter"

    expect(current_path).to eq auth_twitter_callback_path
    expect(page).to have_content 'Signed in!'
    expect(page).to have_content "Sign Out"
  end

end
