require 'rubygems'
require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'rack'

Capybara.run_server = true
Capybara.server_port = 9494

Capybara.app = Rack::Directory.new(File.join(Dir.pwd, "public"))
Capybara.current_driver = :selenium
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  # config.order = 'random'
  config.include Capybara::DSL # It contain all the methods you use for writing test. If you do not use it , get this error.
end
