require 'spec_helper'

describe 'log in user with twitter' do

  it "allows existing user to log in via twitter" do
    User.create(username: 'mockuser')

    visit root_path
    mock_auth_hash # OmniauthMockHelper.mock_auth_hash
    click_link "Sign In"

    expect(page).to have_content 'Sign out'
  end

end
