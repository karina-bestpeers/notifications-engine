# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require "active_record/railtie"
require "action_controller/railtie"
require 'rspec/rails'

require_relative '../test/dummy/config/environment'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
ENV['RAILS_ENV'] ||= 'test'
ActiveRecord::Migrator.migrations_paths = [File.expand_path('dummy/db/migrate', __dir__)]

# Add additional requires below this line. Rails is not loaded until this point!
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
# ActiveRecord::Base.establish_connection(:test)

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
  end


  config.before(:suite) do
    ActiveRecord::Base.establish_connection
    ActiveRecord::Base.connection
  end
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  # To clean the test database records
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
