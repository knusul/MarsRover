require "./spec/spec_helper"

describe Robot, "instance" do
  let(:position){Position.new(2,2)}
  let(:compass){Compass.new("N")}
  subject {Robot.new(position, compass) }

  it "has a position" do
    subject.position.should eq position
  end

  it "point in direction" do
    subject.compass.direction.should eq compass.direction
  end

  it "move forward" do
    subject.move
    subject.position.should eq Position.new(2,3)
  end

  it "turn left" do
    subject.turn_left.should eq "W"
    subject.turn_left.should eq "S"
    subject.turn_left.should eq "E"
    subject.turn_left.should eq "N"
  end

  it "turn right" do
    subject.turn_right.should eq "E"
    subject.turn_right.should eq "S"
    subject.turn_right.should eq "W"
    subject.turn_right.should eq "N"
  end

  it "should move around" do
    subject.move
    subject.turn_right
    subject.move
    subject.move
    subject.turn_left
    subject.move
    subject.position.should eq Position.new(4,4)
  end
end
