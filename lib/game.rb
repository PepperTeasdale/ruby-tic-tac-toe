class Game
  def initialize(board:, players:)
    @board = board
    @players = players
  end

  def finished?
    board.full?
  end

  private

  attr_reader :board, :players
end
