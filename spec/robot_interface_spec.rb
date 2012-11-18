require "./lib/robot_interface"
require "./lib/position"
require "rspec"
describe RobotInterface do

  subject {RobotInterface.new(Robot.new(Position.new(0,0), Compass.new("N")))}
  it "should accept command" do
    subject.evaluate_command("M").should eq "0 1 N"
  end

  it "should accept command list" do
    subject.evaluate_command_list("MMRMMRM").should eq "2 1 S"
  end
end
