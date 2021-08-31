# frozen_string_literal: true

class Player
  attr_reader :name, :marker

  def initialize(name:, marker:)
    @name = name
    @marker = marker
  end

  def get_move(game)
    puts "#{name} turn"
    puts 'Enter row and column you want to mark, separated by a space:'
    puts
    puts game.board

    cell = gets.chomp.split(' ').map(&:to_i)
    if cell.length != 2
      raise InvalidInputError, 'Invalid input. Type the row and column where you wish to place your marker
separated by a space (e.g. "0 2")'
    end

    cell
  end

  class InvalidInputError < RuntimeError; end
end
