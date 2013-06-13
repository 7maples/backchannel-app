ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
  config.include(OmniauthMockHelper)
end

OmniAuth.config.test_mode = true
