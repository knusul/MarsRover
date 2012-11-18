require "./spec/spec_helper"

describe RobotInterface do
  let(:position){ Position.new(0,0) }
  let(:compass){ Compass.new("N") }
  subject{ RobotInterface.new(Robot.new(position, compass)) }

  it "should accept command" do
    subject.evaluate_command("M").should eq "0 1 N"
  end

  it "should accept command list" do
    subject.evaluate_command_list("MMRMMRM").should eq "2 1 S"
  end
end
