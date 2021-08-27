require_relative "./game"
require_relative "./board"
require_relative "./player"

class MainLoop
  def initialize(game)
    @game = game
  end

  def run
    clear
    puts "#{game.current_player.name} turn"
    puts "Enter row and column you want to mark, separated by a space:"
    puts
    puts game.board

    row, col = gets.chomp.split(" ").map(&:to_i)

    game.make_move(row, col)
  end

  def clear
    `clear` || `cls`
  end

  private

  attr_reader :game
end

if __FILE__ == $0
  player_1 = Player.new(name: 'Player 1', marker: 'x')
  player_2 = Player.new(name: 'Player 2', marker: 'y')
  board = Board.new
  game = Game.new(board: board, players: [player_1, player_2])

  while !game.finished?
    MainLoop.new(game).run
  end

  if game.winner
    puts "#{game.winner.name} wins!"
  else
    puts "Cat's game"
  end
end
