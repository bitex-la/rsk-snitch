$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rsk_snitch"
require "net/http"

RSpec.configure do |config|
  config.order = "random"

  config.mock_with :rspec do |mocks|
    mocks.syntax = [:expect, :should]
  end

  config.expect_with :rspec do |c|
    c.syntax = [:expect, :should]
  end

  config.before :all do
    @server_pid = fork do
      Faye::WebSocket.load_adapter('thin')

      FakeServer = lambda do |env|
        if Faye::WebSocket.websocket?(env)
          socket = Faye::WebSocket.new(env)

          socket.on :open do 
            File.open("spec/messages_fixture.txt").each_line do |line|
              socket.send(line)
            end
            socket.close
          end

          socket.rack_response
        else
          [200, {'Content-Type' => 'text/plain'}, ['Hello']]
        end
      end

      Thin::Logging.silent = true
      thin = Rack::Handler.get('thin')
      thin.run(FakeServer, :Port => 9292)
    end
    nil until (open('http://localhost:9292').read rescue nil)
  end

  config.after :all do
    Process.kill "USR2", @server_pid
    Process.wait
  end
end
