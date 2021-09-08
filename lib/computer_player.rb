# frozen_string_literal: true

require_relative './player'

class ComputerPlayer < Player
  def get_move(game)
    game.available_moves[Random.rand(game.available_moves.length)]
  end
end
