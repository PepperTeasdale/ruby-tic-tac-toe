class Game
  class OccupiedCellError < Exception; end

  def initialize(board:, players:)
    @board = board
    @players = players
    @current_move = 0
  end

  def finished?
    board.full? || !!winner
  end

  def winner
    players.find do |player|
      board.sequences.any? do |seq|
        seq.uniq.length == 1 && seq.first == player.marker
      end
    end
  end

  def current_player
    return players[@current_move]
  end

  def make_move(row, col)
    check_move(row, col)
    board.set_cell_value(row, col, current_player.marker)
    increment_current_move
  end

  private

  def check_move(row, col)
    board.valid_cell?(row, col)
    raise OccupiedCellError if board.get_cell_value(row, col) != " "
  end

  def increment_current_move
    @current_move = (@current_move + 1) % players.length
  end

  attr_reader :board, :players
end
