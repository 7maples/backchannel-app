module OmniauthMockHelper
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      'uid' => '123545',
      'info' => {
        'nickname' => 'mockuser',
        'name' => 'john doe',
        'image' => 'mock_user_thumbnail_url'
      },
    })
  end
end
