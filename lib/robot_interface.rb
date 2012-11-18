require "./lib/robot"

class RobotInterface

  def initialize robot
    @robot = robot
  end

  def evaluate_command_list cmd_list
    cmd_list.each_char do |command|
      evaluate_command command
    end
    @robot.to_s
  end

  def evaluate_command cmd
    case cmd
    when "L"
      @robot.turn_left
    when "R"
      @robot.turn_right
    when "M"
      @robot.move
    end
    @robot.to_s
  end

  def get_robot_position
    @robot.to_s
  end
end
