class Pawn
  def initialize(symbol, default_location)
    @symbol = symbol
    @current_location = default_location
    @history = []
  end

  def change_location(new_location)
    @history << @current_location
    @current_location = new_location
  end

  def find_possible_moves
    possible_moves_array = []
    square_ahead = lambda do |square|
      next_square = ''
      next_square << square.chars[0]
      next_square << (square.chars[1].to_i + 1).to_s
      next_square
    end
    if @history.empty?
      possible_moves_array << square_ahead.call(@current_location)
      possible_moves_array << square_ahead.call(possible_moves_array[0])
    else
      possible_moves_array << square_ahead.call(@current_location)
    end
    possible_moves_array
  end

  def move_piece
    puts "Where would you like to move this peice to?"
    player_response = gets.chomp.strip.downcase
    unless find_possible_moves.include?(player_response)
      puts "This is not a valid move. Please choose a valid move. The valid moves available with this peice are: "
      find_possible_moves.each { |move| print "#{move} " }
      puts
      return move_peice
    end
    change_location(player_response)
  end

  attr_reader :symbol

  # protected

  attr_accessor :current_location, :history
end
