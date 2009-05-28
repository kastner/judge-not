# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "jeremymcanally-context", :lib => "context", :source => "http://gems.github.com/"
  config.gem "lucashungaro-matchy", :lib => "matchy", :source => "http://gems.github.com/"
  
  config.time_zone = 'UTC'
  config.action_controller.session = {
    :session_key => '_judge-not_session',
    :secret      => '1a82233e89636c32af0cc4418b61d14d787b48237776c6284a0c5ac7b2cf8c5a9536f85aeafa2565c1d196c0d9e260b672dbc193595887528d6edddf943d3687'
  }
end
