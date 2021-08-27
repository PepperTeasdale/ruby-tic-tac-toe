require "minitest/autorun"
require_relative "../lib/board"

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_to_s_shows_initial_board_state
    expected_board = <<~BOARD.chomp
   |   |   
-----------
   |   |   
-----------
   |   |   
    BOARD

    assert_equal expected_board, @board.to_s
  end

  def test_to_s_shows_board_state_after_cells_are_set
    expected_board = <<~BOARD.chomp
 x |   |   
-----------
   |   |   
-----------
   |   |   
    BOARD

    @board.set_cell_value(0, 0, "x")
    assert_equal expected_board, @board.to_s
  end

  def test_get_cell_value_returns_symbol_of_the_specified_cell_value
    actual = @board.get_cell_value(0, 0)
    assert_equal " ", actual
  end

  def test_set_cell_value_updates_the_cell_state
    @board.set_cell_value(0, 0, "x")
    actual = @board.get_cell_value(0, 0)
    assert_equal "x", actual
  end
end
