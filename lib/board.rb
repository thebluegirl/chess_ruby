class Board
  def initialize
    @columns = %w[a b c d e f g h]
    @rows = %w[1 2 3 4 5 6 7 8]
    @squares = create_squares
  end

  def create_squares
    squares = []
    @columns.each do |column|
      @rows.each do |row|
        square = ''
        square << column
        square << row
        squares << square
      end
    end
    squares
  end

  attr_reader :squares

  # protected

end
