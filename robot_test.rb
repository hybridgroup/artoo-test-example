require './test_helper'
require './test_robot'

describe 'sphero' do
  let(:robot) { Artoo::MainRobot.new }
  let (:start) { Time.now }

  before :each do
    Timecop.travel(start)
    robot.work
  end

  after :each do
    Timecop.return
  end

  it 'has work to do every 3 seconds' do
    robot.has_work?(:every, 3.seconds).wont_be_nil
  end

  it 'receives collision event' do
    robot.expects(:contact)
    robot.sphero.publish("collision", "clunk")
    process_messages
  end

  it 'must roll every 3 seconds' do
    Timecop.travel(start + 3.seconds) do
      robot.sphero.expects(:roll)
      process_messages
    end
    Timecop.travel(start + 6.seconds) do
      robot.sphero.expects(:roll)
      process_messages
    end
  end
end
