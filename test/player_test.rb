# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/player'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new(name: 'Jane', marker: '🦜')
  end

  def test_name
    assert_equal('Jane', @player.name)
  end

  def test_marker
    assert_equal('🦜', @player.marker)
  end
end
