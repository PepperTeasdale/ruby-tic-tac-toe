# frozen_string_literal: true

class Player
  attr_reader :name, :marker

  def initialize(name:, marker:)
    @name = name
    @marker = marker
  end

  def get_move(_game)
    raise NotImplementedError, "must implement #get_move in subclass of #{self.class}"
  end

  class InvalidInputError < RuntimeError; end
end
