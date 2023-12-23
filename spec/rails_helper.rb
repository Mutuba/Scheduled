# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] = 'test'
require_relative '../config/environment'
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'database_cleaner'

# Require support files
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Configure shoulda matchers
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include ActionCable::TestHelper
  config.include ActiveJob::TestHelper
  ActiveJob::Base.queue_adapter = :test
  config.include Devise::Test::IntegrationHelpers, type: :request
  include ActiveSupport::Testing::TimeHelpers
  config.infer_spec_type_from_file_location!
  config.include Rails.application.routes.url_helpers, type: :request

  config.before(:suite) do
    DatabaseCleaner.allow_remote_database_url = true
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
