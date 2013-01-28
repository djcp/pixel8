$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))

require 'bundler/setup'
Bundler.require(:development)

require 'pixel_converter'

Dir['./spec/support/**/*.rb'].each {|f| require f }
