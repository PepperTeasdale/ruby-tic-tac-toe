class Board
  EMPTY_SPACE = " "
  X = "x"
  O = "o"

  class InvalidCellError < Exception; end

  def initialize(board = empty_board)
    @board = board
  end

  def to_s
    board.map do |row|
      row.map { |cell| " #{cell} " }.join("|")
    end.join("\n-----------\n")
  end

  def get_cell_value(row, col)
    return board[row][col]
  end

  def set_cell_value(row, col, value)
    board[row][col] = value
  end

  def full?
    !board.flatten.any? { |cell| cell == Board::EMPTY_SPACE }
  end

  def sequences
    # TODO: diagonals hard-coded to 3x3 board
    board + board.transpose + [
      [board[0][0], board[1][1], board[2][2]],
      [board[2][0], board[1][1], board[0][2]],
    ]
  end

  def valid_cell?(row, column)
    unless row.between?(0, board.length) && column.between?(0, board.length)
      raise InvalidCellError.new "Row and Column values must be between 0 and #{board.length}"
    end
  end

  private

  attr_accessor :board

  def empty_board
    [
      [Board::EMPTY_SPACE, Board::EMPTY_SPACE, Board::EMPTY_SPACE],
      [Board::EMPTY_SPACE, Board::EMPTY_SPACE, Board::EMPTY_SPACE],
      [Board::EMPTY_SPACE, Board::EMPTY_SPACE, Board::EMPTY_SPACE],
    ]
  end
end
