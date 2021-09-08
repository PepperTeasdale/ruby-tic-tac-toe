# frozen_string_literal: true

require_relative './game'
require_relative './board'
require_relative './human_player'
require_relative './computer_player'

class MainLoop
  def initialize(game)
    @game = game
  end

  def run
    clear

    until game.finished?
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
    system('clear') || system('cls')
  end

  private

  attr_reader :game
end

if __FILE__ == $PROGRAM_NAME
  player_1 = HumanPlayer.new(name: 'Player 1', marker: Board::X)
  player_2 = ComputerPlayer.new(name: 'Player 2', marker: Board::O)
  board = Board.new
  game = Game.new(board: board, players: [player_1, player_2])

  MainLoop.new(game).run
end
