require "minitest/autorun"
require_relative "../lib/board"

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_board_to_s_shows_board_state
    expected_board = <<~BOARD
   |   |
-----------
   |   |
-----------
   |   |
    BOARD

    assert_equal expected_board, @board.to_s
  end
end
