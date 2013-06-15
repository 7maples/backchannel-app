require 'spec_helper'

describe 'login' do
  describe 'log in user with twitter' do
    it "allows existing user to log in via twitter" do
      visit root_path
      mock_auth_hash # OmniauthMockHelper.mock_auth_hash
      click_link "Sign in with Twitter"

      expect(current_path).to eq root_path
      expect(page).to have_content 'Signed in!'
      expect(page).to have_link "Sign Out"
    end

  end

  describe 'Sign out user' do
    it "allows current user to sign out" do
      visit root_path
      mock_auth_hash # OmniauthMockHelper.mock_auth_hash
      click_link "Sign in with Twitter"
      expect(page).to have_content 'Signed in!'

      click_link "Sign Out"
      expect(current_path).to eq root_path
      expect(page).to have_content "Sign in with Twitter"
    end
  end
end
