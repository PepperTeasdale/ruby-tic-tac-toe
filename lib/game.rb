class Game
  def initialize(board:, players:)
    @board = board
    @players = players
  end

  def finished?
    false
  end
end
