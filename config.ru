require 'rubygems'
require 'test_sinatra_app'

TestSinatraApp::Service.set :sky_color, :yellow
run TestSinatraApp::Service
