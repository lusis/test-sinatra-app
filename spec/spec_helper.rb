require File.join(File.dirname(__FILE__), '..', 'lib', 'test_sinatra_app')
require File.join(File.dirname(__FILE__), '..', 'lib', 'test_sinatra_app', 'app')

require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = "documentation"
  config.include Rack::Test::Methods
end

def app
  TestSinatraApp::Service
end
