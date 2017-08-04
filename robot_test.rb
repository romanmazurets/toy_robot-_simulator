require './robot'
require 'minitest/autorun'

class TestRobot < Minitest::Test
  def setup
    @robot = Robot.new
  end

  def test_place
    @robot.place(1, 2, :west)
    assert_equal @robot.x, 1
    assert_equal @robot.y, 2
    assert_equal @robot.facing, :west
  end

  def test_place_with_wrong_facing
    @robot.place(1, 2, :aaa)
    assert_equal @robot.x, 1
    assert_equal @robot.y, 2
    assert_nil @robot.facing
  end

  def test_place_with_wrong_position
    @robot.place(5, 6, :west)
    assert_nil @robot.x
    assert_nil @robot.y
    assert_equal @robot.facing, :west
  end

  def test_report
    @robot.place(1, 2, :east)
    assert_equal @robot.report, {x: 1, y: 2, facing: :east}
  end

  def test_move
    @robot.place(0, 0, :east)
    @robot.move
    assert_equal @robot.report, {x:1, y:0, facing: :east}
  end

  def test_out_of_range_move
    @robot.place(4, 0,  :east)
    @robot.move
    assert_equal @robot.report, {x:4, y:0, facing: :east}
  end

  def test_left
    @robot.place(0,0,:north)
    @robot.left
    assert_equal @robot.facing, :west
  end

  def test_right
    @robot.place(0,0,:west)
    @robot.right
    assert_equal @robot.facing, :north
  end

  def test_action_on_noplaced_robot
    assert_nil @robot.report
  end
end
