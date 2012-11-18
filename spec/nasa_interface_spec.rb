require "rspec"
require "./lib/nasa_interface"
describe NasaInterface do
  it "validates commands" do
    subject.valid_commands?("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM").should == true
  end

  it "evaluates commands" do
    subject.evaluate("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM").should eq "1 3 N\n5 1 E\n"
  end
end
