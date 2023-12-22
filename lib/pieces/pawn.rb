require_relative '../board'

class WhitePawn
  def initialize(default_location)
    @symbol = '♙'
    @current_location = default_location
    @history = []
    @board = Board.new
  end

  def change_location(new_location)
    @history << @current_location
    @current_location = new_location
  end

  def find_possible_moves
    add_square = lambda do |number=1|
      new_square = "#{@current_location}"
      new_square[1] = (new_square[1].to_i + number).to_s
      @board.squares.include?(new_square) ? new_square : nil
    end

    if @history.empty?
      possible_moves_array = [add_square.call, add_square.call(2)]
      possible_moves_array.include?(nil) ? possible_moves_array.delete(nil) : possible_moves_array
    else
      possible_moves_array = [add_square.call]
      possible_moves_array.include?(nil) ? possible_moves_array.delete(nil) : possible_moves_array
    end
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

  attr_accessor :current_location, :history, :board
end


class BlackPawn
  def initialize(default_location)
    @symbol = '♟︎'
    @current_location = default_location
    @history = []
    @board = Board.new
  end

  def change_location(new_location)
    @history << @current_location
    @current_location = new_location
  end

  def find_possible_moves
    add_square = lambda do |number=1|
      new_square = "#{@current_location}"
      new_square[1] = (new_square[1].to_i - number).to_s
      @board.squares.include?(new_square) ? new_square : nil
    end

    if @history.empty?
      possible_moves_array = [add_square.call, add_square.call(2)]
      possible_moves_array.include?(nil) ? possible_moves_array.delete(nil) : possible_moves_array
    else
      possible_moves_array = [add_square.call]
      possible_moves_array.include?(nil) ? possible_moves_array.delete(nil) : possible_moves_array
    end
  end

  def move_piece
    puts 'Where would you like to move this piece to?'
    square = gets.chomp.strip.downcase
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

  def upgrade_possible?
    @current_location.end_with?('7') ? true : false
  end

  attr_reader :symbol

  # protected

  attr_accessor :current_location, :history
end
