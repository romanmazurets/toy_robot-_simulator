class Robot
  SQUARE_LIMIT = 5
  @x = *(0..4)
  @y = *(0..4)

  attr_reader :x, :y

  def initialize(x=0, y=0)
    @x = x
    @y = y
  end

  def place(x, y)
    @x = x
    @y = y
  end

  def hello
    "robot"
  end
end
