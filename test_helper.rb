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
