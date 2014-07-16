ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
include Devise::TestHelpers

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!
DatabaseCleaner.strategy = :transaction #
 
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods # 
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
 
  config.use_transactional_fixtures = true 
 
  config.filter_run focus:true #
  config.run_all_when_everything_filtered = true # => 
 
  config.before :each do #
    DatabaseCleaner.start #
  end #
 
  config.after :each do #
    DatabaseCleaner.clean #
  end
end