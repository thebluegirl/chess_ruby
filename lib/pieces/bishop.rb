require_relative '../board'

class WhiteBishop
  def initialize(default_location)
    @symbol = '♗'
    @current_location = default_location
    @history = []
    @board = Board.new
  end

  def change_location(new_location)
    @history << @current_location
    @current_location = new_location
  end

  attr_reader :symbol

  # protected

  attr_accessor :current_location, :history
end

class BlackBishop
  def initialize(default_location)
    @symbol = '♝'
    @current_location = default_location
    @history = []
    @board = Board.new
  end

  def change_location(new_location)
    @history << @current_location
    @current_location = new_location
  end

  attr_reader :symbol

  # protected

  attr_accessor :current_location, :history
end
