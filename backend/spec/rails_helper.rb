ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require File.join(File.dirname(__FILE__), 'support/database_cleaner')
require File.join(File.dirname(__FILE__), 'support/factory_girl')
require 'capybara/rspec'
require 'spec_helper'
require "pry"
require "database_cleaner"
require 'rspec/rails'
require 'shoulda-matchers'
require "capybara/rails"
require 'valid_attribute/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.include Helpers::Controllers, type: :controller
end
