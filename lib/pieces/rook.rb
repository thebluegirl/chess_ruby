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

  def move_piece
    puts 'Where would you like to move this piece to?'
    square = gets.chomp.strip.downcase
    p find_possible_moves
    unless find_possible_moves.include?(square)
      puts 'This is not a valid move for this piece. The possible moves you can make are: '
      find_possible_moves.each do |move|
        print "#{move} "
      end
      puts
      return move_piece
    end
    return square
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

  def move_piece
    puts 'Where would you like to move this piece to?'
    square = gets.chomp.strip.downcase
    p find_possible_moves
    unless find_possible_moves.include?(square)
      puts 'This is not a valid move for this piece. The possible moves you can make are: '
      find_possible_moves.each do |move|
        print "#{move} "
      end
      puts
      return move_piece
    end
    return square
  end

  attr_reader :symbol

  # protected

  attr_accessor :current_location, :history
end
