  require 'spec_helper'

describe "New User" do
  before(:each) do
    @user = User.new(name: 'john doe', nickname: 'johnny1',
                       twitter_id: 1234, image_url: 'www.example.com')
  end

  it "is invalid without a name" do
    @user.name = nil
    expect(@user).to have(1).errors_on(:name)
  end

  it "is invalid without a nickname" do
    @user.nickname = nil
    expect(@user).to have(1).errors_on(:nickname)
  end

  it "is invalid without a twitter id" do
    @user.twitter_id = nil
    expect(@user).to have(1).errors_on(:twitter_id)
  end

    it "is invalid without an image url" do
    @user.image_url = nil
    expect(@user).to have(1).errors_on(:image_url)
  end

end


