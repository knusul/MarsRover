require "./lib/position"
require "./lib/compass"
class Robot
  attr_accessor :position, :compass

  def initialize position, compass
    @position = position
    @compass = compass
  end

  def move
    case self.compass.direction
    when "N"
      self.position = Position.new(self.position.x, self.position.y + 1)
    when "S"
      self.position = Position.new(self.position.x, self.position.y -  1)
    when "W"
      self.position = Position.new(self.position.x - 1, self.position.y)
    when "E"
      self.position = Position.new(self.position.x + 1, self.position.y)
    end
    self.position
  end

  def turn_left
    compass.turn_left
  end

  def turn_right
    compass.turn_right
  end
  def to_s
    position.to_s + " " + compass.to_s
  end

end
