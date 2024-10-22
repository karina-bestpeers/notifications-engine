require_relative 'environment'
require 'rails/all'
require 'notifications_engine'

module DummyApp
  class Application < Rails::Application
    config.load_defaults 7.0
    config.eager_load = false
    config.secret_key_base = ENV["SECRET_KEY"]
  end
end
