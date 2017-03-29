$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rsk_snitch"

RSpec.configure do |config|
  config.order = "random"
  config.mock_with :rspec do |mocks|
    mocks.syntax = [:expect, :should]
  end
end
