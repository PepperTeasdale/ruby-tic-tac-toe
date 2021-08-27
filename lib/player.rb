class Player
  attr_reader :marker

  def initialize(name:, marker:)
    @marker = marker
  end
end
