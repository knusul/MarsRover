class Position
  attr_accessor :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def == (that)
    self.x == that.x && self.y == that.y
  end

  def to_s
    "#{@x} #{@y}"
  end
end
