require_relative 'player'
require_relative 'board'

class Game
  def initialize
    @player1 = Player.new('White')
    @player2 = Player.new('Black')
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
      print number.to_s
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
      print number.to_s
      puts
    end

    print '  a  b  c  d  e  f  g  h '
    puts
    print_row.call(1)
    print_row.call(2)
    print_row.call(3)
    print_row.call(4)
    print_row.call(5)
    print_row.call(6)
    print_row.call(7)
    print_row.call(8)
    print '  a  b  c  d  e  f  g  h '
    puts
  end

  def select_piece(player)
    piece_finder = lambda do |selected_square|
      player.pieces.each do |piece|
        return piece if piece.current_location == selected_square
      end
      false
    end

    selected_square = player.select_piece
    unless @board.squares.include?(selected_square)
      puts 'This is not a valid square. Please select a valid square.'
      return select_piece(player)
    end

    if piece_finder.call(selected_square)
      return piece_finder.call(selected_square)
    else
      puts 'You have no pieces on this square. Please select the square with the peice you would like to move.'
      return select_piece(player)
    end
  end

  def move_piece(player)
    puts "#{player.player_id}'s turn"
    piece = select_piece(player)
    piece.change_location(piece.move_piece)
  end

  def player_turn(player)
    print_board
    move_piece(player)
  end

  def players_turn
    player_turn(@player1)
    player_turn(@player2)
  end


  def occupied_square?(square)
    square_check = lambda do |player|
      player.pieces.each do |piece|
        return true if piece.current_location == square
      end
      false
    end

    if square_check.call(@player1) || square_check.call(@player2)
      true
    else
      false
    end
  end

  # protected

  attr_accessor :player1, :player2
end
