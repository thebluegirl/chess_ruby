require_relative 'player'
require_relative 'board'

class Game
  def initialize
    @player1 = Player.new('white')
    @player2 = Player.new('black')
    @board = Board.new
  end

  def print_board
    player_peices_check = lambda do |square, player|
      player.pieces.each do |piece|
        return piece.symbol if piece.current_location == square
      end
      false
    end

    print_row = lambda do |number|
      @board.squares.each do |square|
        if square.end_with?(number.to_s)
          if player_peices_check.call(square, @player1)
            print "|#{player_peices_check.call(square, @player1)}|"
          elsif player_peices_check.call(square, @player2)
            print "|#{player_peices_check.call(square, @player2)}|"
          else
            print "|_|"
          end
        end
      end
      puts
    end

    print_row.call(1)
    print_row.call(2)
    print_row.call(3)
    print_row.call(4)
    print_row.call(5)
    print_row.call(6)
    print_row.call(7)
    print_row.call(8)
  end
end
