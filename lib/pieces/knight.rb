require_relative '../board'

class WhiteKnight
  def initialize(default_location)
    @symbol = '♘'
    @current_location = default_location
    @history = []
    @board = Board.new
  end

  def change_location(new_location)
    @history << @current_location
    @current_location = new_location
  end

  def find_possible_moves
    possible_moves = []
    bytes = @current_location.bytes
    column = bytes[0]
    row = bytes[1]
    on_board = lambda do |square|
      possible_moves << square if @board.squares.include?(square)
    end
    square1 = "#{(column + 1).chr}#{(row + 2).chr}"
    on_board.call(square1)
    square2 = "#{(column + 2).chr}#{(row + 1).chr}"
    on_board.call(square2)
    square3 = "#{(column - 2).chr}#{(row - 1).chr}"
    on_board.call(square3)
    square4 = "#{(column - 1).chr}#{(row - 2).chr}"
    on_board.call(square4)
    square5 = "#{(column + 1).chr}#{(row - 2).chr}"
    on_board.call(square5)
    square6 = "#{(column - 1).chr}#{(row + 2).chr}"
    on_board.call(square6)
    square7 = "#{(column + 2).chr}#{(row - 1).chr}"
    on_board.call(square7)
    square8 = "#{(column - 2).chr}#{(row + 1).chr}"
    on_board.call(square8)
    possible_moves
  end

  attr_reader :symbol

  # protected

  attr_accessor :current_location, :history
end

class BlackKnight
  def initialize(default_location)
    @symbol = '♞'
    @current_location = default_location
    @history = []
    @board = Board.new
  end

  def change_location(new_location)
    @history << @current_location
    @current_location = new_location
  end

  def find_possible_moves
    possible_moves = []
    bytes = @current_location.bytes
    column = bytes[0]
    row = bytes[1]
    on_board = lambda do |square|
      possible_moves << square if @board.squares.include?(square)
    end
    square1 = "#{(column + 1).chr}#{(row + 2).chr}"
    on_board.call(square1)
    square2 = "#{(column + 2).chr}#{(row + 1).chr}"
    on_board.call(square2)
    square3 = "#{(column - 2).chr}#{(row - 1).chr}"
    on_board.call(square3)
    square4 = "#{(column - 1).chr}#{(row - 2).chr}"
    on_board.call(square4)
    square5 = "#{(column + 1).chr}#{(row - 2).chr}"
    on_board.call(square5)
    square6 = "#{(column - 1).chr}#{(row + 2).chr}"
    on_board.call(square6)
    square7 = "#{(column + 2).chr}#{(row - 1).chr}"
    on_board.call(square7)
    square8 = "#{(column - 2).chr}#{(row + 1).chr}"
    on_board.call(square8)
    possible_moves
  end

  attr_reader :symbol

  # protected

  attr_accessor :current_location, :history
end
