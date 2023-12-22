require_relative '../board'

class WhiteRook
  def initialize(default_location)
    @symbol = '♖'
    @current_location = default_location
    @history = []
    @board = Board.new
  end

  def change_location(new_location)
    @history << @current_location
    @current_location = new_location
  end

  def find_possible_moves
    possible_moves_array = []
    horizontal_moves = @board.squares.select { |square| square.end_with?(@current_location[1]) }
    vertical_moves = @board.squares.select { |square| square.start_with?(@current_location[0]) }
    horizontal_moves.each { |move| possible_moves_array << move }
    vertical_moves.each { |move| possible_moves_array << move }
    possible_moves_array.delete(@current_location)
    possible_moves_array
  end

  attr_reader :symbol

  # protected

  attr_accessor :current_location, :history
end

class BlackRook
  def initialize(default_location)
    @symbol = '♜'
    @current_location = default_location
    @history = []
    @board = Board.new
  end

  def change_location(new_location)
    @history << @current_location
    @current_location = new_location
  end

  def find_possible_moves
    possible_moves_array = []
    horizontal_moves = @board.squares.select { |square| square.end_with?(@current_location[1]) }
    vertical_moves = @board.squares.select { |square| square.start_with?(@current_location[0]) }
    horizontal_moves.each { |move| possible_moves_array << move }
    vertical_moves.each { |move| possible_moves_array << move }
    possible_moves_array.delete(@current_location)
    possible_moves_array
  end

  attr_reader :symbol

  # protected

  attr_accessor :current_location, :history
end
