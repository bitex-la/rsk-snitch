require "spec_helper"
require 'thread'

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
    [200, {'Content-Type' => 'text/plain'}, ['']]
	end
end

Thread.new do
	Thin::Logging.silent = true
	thin = Rack::Handler.get('thin')
	thin.run(FakeServer, :Port => 9292)
end

describe RskSnitch do
  it "has a version number" do
    expect(RskSnitch::VERSION).not_to be nil
  end

  it "Checks for an existing node" do
		RskSnitch::RskNodeChecker.stub(url: "ws://localhost:9292")
		expect(RskSnitch::RskNodeChecker.check('bitex')).to be_truthy
  end

  it "Does not have a non existing node" do
		RskSnitch::RskNodeChecker.stub(url: "ws://localhost:9292")
		expect(RskSnitch::RskNodeChecker.check('bogusnode')).to be_falsey
  end
end


