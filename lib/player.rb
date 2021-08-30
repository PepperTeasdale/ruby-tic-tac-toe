class Player
  attr_reader :name, :marker

  def initialize(name:, marker:)
    @name = name
    @marker = marker
  end

  def get_move(game)
    puts "#{self.name} turn"
    puts "Enter row and column you want to mark, separated by a space:"
    puts
    puts game.board

    cell = gets.chomp.split(" ").map(&:to_i)
    if cell.length != 2
      raise InvalidInputError.new(
        'Invalid input. Type the row and column where you wish to place your marker 
separated by a space (e.g. "0 2")'
      )
    end

    return cell
  end

  class InvalidInputError < Exception; end
end
