require 'sinatra/base'
require 'openssl'
require 'net/https'
require 'uri'

module TestSinatraApp
  class Service < Sinatra::Base

    configure do
      set :app_file, __FILE__
      set :views, File.expand_path(File.join(File.dirname(__FILE__), "..","..","views"))
      set :server, %w[thin mongrel webrick]
      set :logging, true
      set :raise_errors, false
      set :show_exceptions, true
      set :run, false
      set :sky_color, ENV['SKY_COLOR'] || :blue
    end

    get "/" do
      "#{settings.sky_color}"
    end

    get "/ssltest/?" do
      uri = URI.parse("https://gist.github.com/raw/833757/d21b2b095c459e62518f10eefa4654b589bfae80/test-gist.txt")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      request = Net::HTTP::Get.new(uri.request_uri)

      response = http.request(request)
      "#{response.body}"
    end

    get "/pemtest/?" do
      cert = OpenSSL::X509::Certificate.new(TestSinatraApp::PEMFILE)
      "#{cert.to_text}"
    end
  end
end
