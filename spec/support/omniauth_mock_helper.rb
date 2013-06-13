module OmniauthMockHelper
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:twitter] = {
      'twitter_id' => '123545',
      'info' => {
        'nickname' => 'mockuser',
        'name' => 'john doe',
        'image_url' => 'mock_user_thumbnail_url'
      },
    }
  end
end
