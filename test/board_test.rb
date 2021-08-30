require "minitest/autorun"
require_relative "../lib/board"

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_board_can_be_initialized_with_custom_board
    board_config = board = [
      [Board::EMPTY_SPACE, Board::EMPTY_SPACE, Board::X],
      [Board::EMPTY_SPACE, Board::EMPTY_SPACE, Board::EMPTY_SPACE],
      [Board::EMPTY_SPACE, Board::EMPTY_SPACE, Board::EMPTY_SPACE],
    ]
    custom_board = Board.new(board_config)

    expected_board = <<~BOARD.chomp
   |   | x 
-----------
   |   |   
-----------
   |   |   
    BOARD

    assert_equal expected_board, custom_board.to_s
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

    @board.set_cell_value(0, 0, Board::X)
    assert_equal expected_board, @board.to_s
  end

  def test_get_cell_value_returns_symbol_of_the_specified_cell_value
    actual = @board.get_cell_value(0, 0)
    assert_equal Board::EMPTY_SPACE, actual
  end

  def test_set_cell_value_updates_the_cell_state
    @board.set_cell_value(0, 0, Board::X)
    actual = @board.get_cell_value(0, 0)
    assert_equal Board::X, actual
  end

  def test_full_returns_true_when_all_cells_are_occupied
    finished_board_config = [
      [Board::X, Board::X, Board::X],
      [Board::X, Board::X, Board::X],
      [Board::X, Board::X, Board::X],
    ]

    full_board = Board.new(finished_board_config)

    assert_equal(true, full_board.full?)
  end

  def test_sequences_returns_all_columns_rows_and_diagonal_sequences
    board_config = [
      ["a", "b", "c"],
      ["d", "e", "f"],
      ["g", "h", "i"],
    ]

    board = Board.new(board_config)

    expected_sequences = [
      ["a", "b", "c"],
      ["d", "e", "f"],
      ["g", "h", "i"],
      ["a", "d", "g"],
      ["b", "e", "h"],
      ["c", "f", "i"],
      ["a", "e", "i"],
      ["g", "e", "c"],
    ]

    assert_equal(expected_sequences, board.sequences)
  end
end
