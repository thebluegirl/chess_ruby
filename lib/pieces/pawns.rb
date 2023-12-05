class Pawn
  def initialize(symbol, default_location)
    @symbol = symbol
    @current_location = default_location
    @history = []
  end

  def move_peice(new_location)
    @history << @current_location
    @current_location = new_location
  end

  # protected

  attr_accessor :history, :current_location
end
