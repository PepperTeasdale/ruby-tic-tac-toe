class MockPlayer
  attr_reader :name, :marker

  def initialize(name:, marker:)
    @name = name
    @marker = marker
    @row = 0
    @col = 0
  end

  def mock_move(row, col)
    @row = row
    @col = col
  end

  def get_move(_game)
    return [row, col]
  end

  private

  attr_reader :row, :col
end
