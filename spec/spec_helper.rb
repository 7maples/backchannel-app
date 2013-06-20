require 'vcr'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'support/omniauth_mock_helper'

RSpec.configure do |config|
  config.include(OmniauthMockHelper)
end

OmniAuth.config.test_mode = true

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end
