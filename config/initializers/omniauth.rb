OmniAuth.config.logger = Rails.logger
OmniAuth.config.full_host = "http://backchannel.pw"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end
