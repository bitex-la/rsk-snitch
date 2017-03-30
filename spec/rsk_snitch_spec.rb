require "spec_helper"
require 'thread'

describe RskSnitch do
  before :each do
		RskSnitch::Nodes.stub(url: "ws://localhost:9292")
  end

  it "Finds a known node" do
    RskSnitch::Nodes.find('bitex').should be_truthy
  end

  it "Does not find an unknown node" do
		RskSnitch::Nodes.find('bogus').should be_falsey
  end

  it "Times out if not found after a number of messages" do
		RskSnitch::Nodes.find('bitex', 10).should be_falsey
  end

  it "Checks a few time to find if a node is up" do
    RskSnitch::Nodes.up?('bitex', 3, 0).should be_truthy
  end

  it "Fails checking for an unknown node" do
    RskSnitch::Nodes.up?('bogus', 3, 0).should be_falsey
  end
end
