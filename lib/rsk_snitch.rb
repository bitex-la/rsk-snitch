require "rsk_snitch/version"
require 'faye/websocket'
require 'byebug'

module RskSnitch
	# Checks the RSK public stats websocket to see if bitex is there
	# Emails admins otherwise
	class RskNodeChecker
		def self.url
			"ws://stats.rsk.co/primus/?_primuscb=#{Time.now.to_i}-0"
		end

		def self.check(needle)
			ws = Faye::WebSocket::Client.new(url)
			found = false
			closed = false

			ws.on :message do |event|
				if Regexp.new(needle) =~ event.data
					found = true 
				end
			end
			
			ws.on(:close){ closed = true }
			
			sleep 0.1  until closed || found
			
			found
		end
	end
end
