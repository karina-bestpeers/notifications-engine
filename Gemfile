source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in notifications_engine.gemspec.
gemspec

gem "puma"

gem 'pg'
gem 'activerecord'

gem "sprockets-rails"
gem 'twilio-ruby'
# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"

group :development, :test do
  gem 'dotenv'
  gem 'pry'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 5.0'
  gem 'database_cleaner-active_record'
end
gem 'rails-controller-testing'
