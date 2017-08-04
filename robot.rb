class Robot
  SQUARE_LIMIT = 5
  DIRECTIONS = %i{north east south west}
  X = *(0..4)
  Y = *(0..4)

  @x = nil
  @y = nil
  @facing = nil
  @placed = false

  attr_reader :x, :y, :facing, :placed

  def place(x, y, f)
    if x && y && f
      @x = x if X.include?(x)
      @y = y if Y.include?(y)
      @facing = f if DIRECTIONS.include?(f)
      @placed = true
    else
      @placed = false
    end
  end

  def report
    {x: @x, y: @y, facing: @facing} if @placed
  end

  def move
    case @facing
      when :south
        @y -= 1 if Y.include?(@y - 1)
      when :north
        @y += 1 if Y.include?(@y + 1)
      when :east
        @x += 1 if X.include?(@x + 1)
      when :west
        @x -= 1 if X.include?(@x - 1)
    end if @placed
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
    
    @facing = DIRECTIONS[(DIRECTIONS.index(@facing) - 1) % 4] if @placed
  end

  def right
    @facing = DIRECTIONS[(DIRECTIONS.index(@facing) + 1) % 4] if @placed
  end
end
