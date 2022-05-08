ENV["APP_ENV"] = "test"

# load the apps

require_relative "../../main"

# Configure RSpec
require "rack/test"
require "rspec"
def app
  Sinatra::Application
end
RSpec.configure do |config|
  config.include Rack::Test::Methods
end
