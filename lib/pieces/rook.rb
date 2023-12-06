class Rook
  def initialize(symbol, default_location)
    @symbol = symbol
    @current_location = default_location
    @history = []
  end

  def change_location(new_location)
    @history << @current_location
    @current_location = new_location
  end

  # protected

  attr_accessor :current_location, :history
end
