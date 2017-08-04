require './robot'
require 'minitest/autorun'
require 'minitest/pride'

class TestRobot < Minitest::Test
  def setup
    @robot = Robot.new
  end

  def test_hello
    assert_equal "robot", @robot.hello
  end

  def test_place
    @robot.place(1, 2)
    assert_equal @robot.x, 1
    assert_equal @robot.y, 2
  end

end
