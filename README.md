# Test Sinatra App
The purpose of this repo is to have, what I would consider, a standard standalone sinatra application that someone might want to package.

The goal is to have it work in the following configurations:

* With and without bundler
* With and without rvm
* MRI installable gem
* JRuby installable gem
* Standalone application via bin script
* rackable application via config.ru
* Warble-packaged deployable warfile (both jetty and tomcat)
* Warble standalone winstone warfile
* SSL works with JRuby

Additionally, it needs to be flexible in accepting a single configuration option: `sky_color`.

## So what works?

* MRI and Jruby specific gem packages
* Standalone bin execution with and without the custom option (MRI and Jruby)
* Rackup with and without custom option (in config.ru) in MRI and Jruby (both rvm and downloaded)

## What's not working?
Warbler. I'm just not having any luck no matter what options I try. I've attempted to make the war:

* With/without gemjar
* With/without executable
* With/without using bundler in warble.rb
* With/without requiring `rubygems` in the config.ru

I've seen every error under the sun in attempting to follow this same application style across three different codebases now:

* Winstone goes into infinite redirect
* LoadErrors on random gems
* Jetty 6 works but Jetty 7 doesn't. Or Tomcat works but no Jetty's work
* jruby-openssl/bouncy castle errors

# How to help
Fork it and fix it. Use it as a test case. Let me know if I'm just expecting to be able to do too much from a single codebase. Show me where I'm screwing up.

# Why?
I work in a cross-vm world. At my day job, we're primarily a java shop. I use Ruby (and especially sinatra) for various glue applications and it's much easier to be able to package and deploy those to a container. The developers need to have those applications available locally for testing, so a winstone self-executing war is a godsend (when it works).

In my personal projects (like Noah), I want to reach the biggest possible audience. I want to make it as easy as possible for someone to try out the application. That means supporting all of the use cases above.
