# setup need for minitest to be happy running under celluloid
require 'minitest/autorun'
require 'celluloid'
MiniTest::Spec.before do
  Celluloid.shutdown
  Celluloid.boot
end

Celluloid.logger = nil

# our chosen mocking/stubbing gems
require 'mocha/setup'
require 'timecop'

# allows Celluloid actors a little time to process messages in their mailboxes
def process_messages
  sleep 0.05
end