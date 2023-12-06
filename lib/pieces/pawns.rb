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
  # protected

  attr_accessor :history, :current_location
end
