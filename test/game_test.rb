require "minitest/autorun"
require_relative "../lib/game"
require_relative "../lib/board"
require_relative "../lib/player"

class GameTest < Minitest::Test
  def setup
    @game = Game.new(
      board: Board.new,
      players: [
        Player.new(name: "Player one", marker: "x"),
        Player.new(name: "Player two", marker: "y"),
      ],
    )
  end

  def test_finished_returns_false_when_the_game_is_not_complete
    assert_equal false, @game.finished?
  end
end
