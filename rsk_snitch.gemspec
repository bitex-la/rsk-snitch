# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rsk_snitch/version'

Gem::Specification.new do |spec|
  spec.name          = "rsk_snitch"
  spec.version       = RskSnitch::VERSION
  spec.authors       = ["nubis"]
  spec.email         = ["yo@nubis.im"]

  spec.summary       = %q{Check if a node is reporting stats in stats.rsk.co}
  spec.description   = %q{Check if a node is reporting stats in stats.rsk.co. Can be used as lib or executable.}
  spec.homepage      = "https://github.com/bitex-la/rsk-snitch"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "faye-websocket", "~> 0.10.3"
  spec.add_dependency "websocket-eventmachine-client", "~> 1.2"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rack", "~> 1.3"
  spec.add_development_dependency "thin", "~> 1.7"
  spec.add_development_dependency "byebug", "~> 1.0"
end
