class Robot
  SQUARE_LIMIT = 5
  DIRECTIONS = %i{north east south west}
  X = *(0..4)
  Y = *(0..4)

  @x = nil
  @y = nil
  @facing = nil

  attr_reader :x, :y, :facing

  def initialize(x=0, y=0)
    @x = x
    @y = y
  end

  def place(x=@x, y=@y, f)
    @x = x if X.include?(x)
    @y = y if Y.include?(y)
    @facing = f if DIRECTIONS.include?(f)
  end

  def report
    {x: @x, y: @y, facing: @facing}
  end

  def move
    case @facing
      when :north
        @y -= 1 if Y.include?(@x - 1)
      when :south
        @y += 1 if Y.include?(@x + 1)
      when :east
        @x += 1 if X.include?(@x + 1)
      when :west
        @x -= 1 if X.include?(@x - 1)
    end
  end

  def left
    # case @facing
    #   when :north
    #     @facing = :west
    #   when :south
    #     @facing = :east
    #   when :east
    #     @facing = :north
    #   when :west
    #     @facing = :south
    # end
    @facing = DIRECTIONS[(DIRECTIONS.index(@facing) - 1) % 4]
  end

  def right
    @facing = DIRECTIONS[(DIRECTIONS.index(@facing) + 1) % 4]
  end

  def hello
    "robot"
  end
end

