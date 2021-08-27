class Game
  def initialize(board:, players:)
    @board = board
    @players = players
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

  private

  attr_reader :board, :players
end
