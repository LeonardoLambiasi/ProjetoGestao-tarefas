# Generated by cucumber-sinatra. (2014-11-15 13:22:37 -0300)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', '../service/server.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Mural

class MuralWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  MuralWorld.new
end
