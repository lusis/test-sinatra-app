# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "test_sinatra_app/version"

Gem::Specification.new do |s|
  s.name        = "test_sinatra_app"
  s.version     = TestSinatraApp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John E. Vincent"]
  s.email       = ["lusis.org+github.com@gmail.com"]
  s.homepage    = "https://github.com/lusis/test_sinatra_app"
  s.summary     = %q{Test Sinatra App}
  s.description = %q{Testing Jruby/MRI bundler/warbler/gemspec packaging}

  s.rubyforge_project = "test_sinatra_app"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("sinatra")
  s.add_dependency("json")
  s.add_dependency("vegas")

  if RUBY_PLATFORM == "java"
    s.add_dependency("jruby-openssl")
    s.add_development_dependency("warbler")
  else
    s.add_dependency("thin")
  end
  s.add_development_dependency("rack-test")
  s.add_development_dependency("rspec")
end
