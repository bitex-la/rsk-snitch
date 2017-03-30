require "rsk_snitch/version"
require 'faye/websocket'
require 'byebug'

module RskSnitch
  # Checks the RSK public stats websocket to see if bitex is there
  # Emails admins otherwise
  class Nodes
    def self.url
      "ws://stats.rsk.co/primus/?_primuscb=#{Time.now.to_i}-0"
    end

    def self.debug=(debug)
      @debug = true
    end
    
    def self.find(node, max_messages = 500)
      found = nil
      EM.run do
        ws = Faye::WebSocket::Client.new(url)
        messages = 0

        ws.on :message do |event|
          puts event.data if @debug
          messages += 1
          found = true if /"id":"#{node}"/ =~ event.data
          ws.close if found || messages > max_messages
        end
        
        ws.on(:close) do
          found ||= false
          EM.stop_event_loop   
        end
      end

      found
    end

    def self.up?(node, retries = 10, wait = 10)
      retries.times do 
        return true if find(node)
        sleep wait
      end
      false
    end
  end
end
