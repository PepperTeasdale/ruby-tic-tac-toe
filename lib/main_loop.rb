require_relative "./game"
require_relative "./board"
require_relative "./player"

class MainLoop
  def initialize(game)
    @game = game
  end

  def run
    clear

    while !game.finished?
      begin
        game.make_move
        clear
      rescue Game::OccupiedCellError, Board::InvalidCellError, Player::InvalidInputError => e
        clear
        puts e.message
        puts
        next
      end
    end

    if game.winner
      puts "#{game.winner.name} wins!"
    else
      puts "Cat's game"
    end
    puts
    puts game.board
  end

  def clear
    system("clear") || system("cls")
  end

  private

  attr_reader :game
end

if __FILE__ == $0
  player_1 = Player.new(name: "Player 1", marker: Board::X)
  player_2 = Player.new(name: "Player 2", marker: Board::O)
  board = Board.new
  game = Game.new(board: board, players: [player_1, player_2])

  MainLoop.new(game).run
end
