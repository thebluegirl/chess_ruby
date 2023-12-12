class Queen
  def initialize(symbol, default_location)
    @symbol = symbol
    @current_location = default_location
    @history = []
  end

  attr_reader :symbol

  # protected

  attr_accessor :current_location, :history
end
