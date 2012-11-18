require "./lib/position"
require "./lib/robot_interface"
require "./lib/robot"
require "./lib/compass"
class NasaInterface
  def evaluate commands
    return unless valid_commands?(commands)
    result = ""
    commands = escaped_area_dimmensions commands.split("\n")
    commands.each_with_index do |cmd, i|
      if (i % 2) == 0
        position = Position.new Integer(cmd.split(" ")[0]), Integer(cmd.split(" ")[1])
        compass = Compass.new cmd.split(" ")[2]
        @interface =  RobotInterface.new(Robot.new(position, compass))
      else
        @interface.evaluate_command_list cmd
        result += @interface.get_robot_position + "\n"
      end
    end
    result
  end

  def valid_commands?(commands)
    splitted_commands = commands.split("\n")
    return false unless splitted_commands.size > 2 && (splitted_commands.size % 2) == 1
    return false unless splitted_commands[0] =~ /(\d)+ (\d)+/
    escaped_area_dimmensions(splitted_commands).each_with_index do |cmd, i|
      if i % 2 == 0
        return false unless cmd =~ /(\d)+ (\d)+ [NSEA]/
      else
        return false unless cmd =~ /[MRL]*/
      end
    end
    true
  end

  private
  def escaped_area_dimmensions commands_array
    commands_array[1..commands_array.size]
  end

end
