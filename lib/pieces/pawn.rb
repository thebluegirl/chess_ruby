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
    add_square = lambda do |number=1|
      new_square = "#{@current_location}"
      new_square[1] = (new_square[1].to_i + number).to_s
      new_square
    end

    if @history.empty?
      [add_square.call, add_square.call(2)]
    else
      [add_square.call]
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
      move_piece
      return
    end
    change_location(square)
  end

  attr_reader :symbol

  # protected

  attr_accessor :current_location, :history
end
