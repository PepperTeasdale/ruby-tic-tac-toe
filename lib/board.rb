class Board
  def initialize
    @board = [
      [:empty, :empty, :empty],
      [:empty, :empty, :empty],
      [:empty, :empty, :empty],
    ]
  end

  def to_s
    <<~BOARD
   |   |
-----------
   |   |
-----------
   |   |
    BOARD
  end

  def get_cell_value(x, y)
    return board[x][y]
  end

  def set_cell_value(x, y, value)
    board[x][y] = value
  end

  private

  attr_accessor :board
end
