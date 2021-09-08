# frozen_string_literal: true

require_relative '../lib/computer_player'
require_relative './mock_player'

class ComputerPlayerTest < Minitest::Test
  def test_get_move_makes_a_valid_move
    computer_player = ComputerPlayer.new(name: 'Hal', marker: '💻')
    board = Board.new([
                        [Board::EMPTY_SPACE, Board::X, Board::O],
                        [Board::X, Board::O, Board::O],
                        [Board::O, Board::X, Board::X]
                      ])
    game = Game.new(
      board: board,
      players: [computer_player, MockPlayer.new(name: 'fake', marker: Board::O)]
    )

    coordinates = computer_player.get_move(game)
    assert_equal([0, 0], coordinates)
  end
end
