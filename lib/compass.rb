class Compass
  DIRECTIONS = ["N", "E", "S", "W"].freeze

  attr_accessor :direction
  def initialize direction
    @direction = direction
  end

  def ==(that)
    self.direction == that.direction
  end

  def turn_left
    self.direction = case self.direction
    when "N"
      "W"
    when "S"
      "E"
    when "E"
      "N"
    when "W"
      "S"
    end
  end

  def turn_right
    self.direction = case self.direction
    when "N"
      "E"
    when "S"
      "W"
    when "E"
      "S"
    when "W"
      "N"
    end
  end
  def to_s
    self.direction
  end
end
