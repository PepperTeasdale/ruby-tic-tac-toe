require "minitest/autorun"
require_relative "../lib/game"
require_relative "../lib/board"
require_relative "../lib/player"
require_relative "./mock_player"

class GameTest < Minitest::Test
  def setup
    @player_1 = MockPlayer.new(name: "Player one", marker: Board::X)
    @player_1.mock_move(0, 0)
    @player_2 = MockPlayer.new(name: "Player two", marker: Board::O)
    @player_2.mock_move(1, 1)

    @game = Game.new(
      board: Board.new,
      players: [
        @player_1,
        @player_2,
      ],
    )
  end

  def test_finished_returns_false_when_the_game_is_not_complete
    assert_equal false, @game.finished?
  end

  def test_finished_returns_true_when_the_game_has_no_open_squares
    finished_board_config = [
      [Board::X, Board::O, Board::X],
      [Board::X, Board::X, Board::O],
      [Board::O, Board::X, Board::O],
    ]
    finished_game = Game.new(
      board: Board.new(finished_board_config),
      players: [
        Player.new(name: "Player one", marker: Board::X),
        Player.new(name: "Player two", marker: Board::O),
      ],
    )

    assert_equal true, finished_game.finished?
  end

  def test_finished_returns_true_when_the_game_has_no_open_squares
    finished_board_config = [
      [Board::X, Board::O, Board::X],
      [Board::X, Board::X, Board::O],
      [Board::O, Board::X, Board::O],
    ]
    finished_game = Game.new(
      board: Board.new(finished_board_config),
      players: [
        Player.new(name: "Player one", marker: Board::X),
        Player.new(name: "Player two", marker: Board::O),
      ],
    )

    assert_equal true, finished_game.finished?
  end

  def test_finished_returns_true_when_the_game_has_a_winner
    won_board_config = [
      [Board::X, Board::X, Board::X],
      [Board::O, Board::O, Board::EMPTY_SPACE],
      [Board::EMPTY_SPACE, Board::EMPTY_SPACE, Board::EMPTY_SPACE],
    ]
    won_game = Game.new(
      board: Board.new(won_board_config),
      players: [
        Player.new(name: "Player one", marker: Board::X),
        Player.new(name: "Player two", marker: Board::O),
      ],
    )

    assert_equal true, won_game.finished?
  end

  def test_winner_gives_winner_on_rows
    won_board_config = [
      [Board::X, Board::X, Board::X],
      [Board::O, Board::O, Board::EMPTY_SPACE],
      [Board::EMPTY_SPACE, Board::EMPTY_SPACE, Board::EMPTY_SPACE],
    ]

    player_1 = Player.new(name: "Player one", marker: Board::X)

    won_game = Game.new(
      board: Board.new(won_board_config),
      players: [
        player_1,
        Player.new(name: "Player two", marker: Board::O),
      ],
    )

    assert_equal player_1, won_game.winner
  end

  def test_winner_gives_winner_on_columns
    won_board_config = [
      [Board::X, Board::O, Board::EMPTY_SPACE],
      [Board::X, Board::O, Board::EMPTY_SPACE],
      [Board::X, Board::EMPTY_SPACE, Board::EMPTY_SPACE],
    ]

    player_1 = Player.new(name: "Player one", marker: Board::X)

    won_game = Game.new(
      board: Board.new(won_board_config),
      players: [
        player_1,
        Player.new(name: "Player two", marker: Board::O),
      ],
    )

    assert_equal player_1, won_game.winner
  end

  def test_winner_gives_winner_on_diagonals
    won_board_config = [
      [Board::O, Board::X, Board::X],
      [Board::X, Board::O, Board::EMPTY_SPACE],
      [Board::X, Board::EMPTY_SPACE, Board::O],
    ]

    player_2 = Player.new(name: "Player two", marker: Board::O)

    won_game = Game.new(
      board: Board.new(won_board_config),
      players: [
        Player.new(name: "Player one", marker: Board::X),
        player_2,
      ],
    )

    assert_equal player_2, won_game.winner
  end

  def test_current_player_starts_with_first_supplied_player
    assert_equal @player_1, @game.current_player
  end

  def test_make_move_rotates_current_player
    @game.make_move
    assert_equal @player_2, @game.current_player

    @game.make_move
    assert_equal @player_1, @game.current_player
  end

  def test_make_move_raises_an_error_if_cell_is_not_valid
    assert_raises Board::InvalidCellError do
      @player_1.mock_move(42, 42)
      @game.make_move
    end
    assert_equal @player_1, @game.current_player
  end

  def test_make_move_raises_an_error_if_cell_is_occupied
    board_config = [
      [Board::X, Board::O, Board::EMPTY_SPACE],
      [Board::EMPTY_SPACE, Board::EMPTY_SPACE, Board::EMPTY_SPACE],
      [Board::EMPTY_SPACE, Board::EMPTY_SPACE, Board::EMPTY_SPACE],
    ]
    player_1 = MockPlayer.new(name: "Player one", marker: Board::X)
    game = Game.new(
      board: Board.new(board_config),
      players: [
        player_1,
        Player.new(name: "Player two", marker: Board::O),
      ],
    )

    assert_raises Game::OccupiedCellError do
      player_1.mock_move(0, 0)
      game.make_move
    end
  end
end
