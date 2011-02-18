require 'sinatra/base'

module TestSinatraApp
  class Service < Sinatra::Base

    configure do
      set :app_file, __FILE__
      set :views, File.expand_path(File.join(File.dirname(__FILE__, "..","..","views")))
      set :server, %w[thin mongrel webrick]
      set :logging, true
      set :raise_errors, false
      set :show_exceptions, false
      set :run, false
      set :sky_color, ENV['SKY_COLOR'] || "blue"
    end

    get "/?" do
      puts settings.sky_color
    end

  end
end
