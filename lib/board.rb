class Board
  def initialize
    @board = [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "],
    ]
  end

  def to_s
    board.map do |row|
      row.map { |cell| " #{cell} " }.join("|")
    end.join("\n-----------\n")
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
