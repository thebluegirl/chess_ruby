require './lib/pieces/pieces'

class Player
  def initialize(player_id)
    @player_id = player_id
    @pieces = create_pieces
  end

  def create_pieces
    pieces_array = []

    if @player_id.downcase == 'white' || @player_id == 1
      pieces_array << left_rook = Rook.new('♖', 'a1')
      pieces_array << left_knight = Knight.new('♘', 'b1')
      pieces_array << left_bishop = Bishop.new('♗', 'c1')
      pieces_array << queen = Queen.new('♕', 'd1')
      pieces_array << king = King.new('♔', 'e1')
      pieces_array << right_bishop = Bishop.new('♗', 'f1')
      pieces_array << left_knight = Knight.new('♘', 'g1')
      pieces_array << right_rook = Rook.new('♖', 'h1')
      pieces_array << pawn1 = Pawn.new('♙', 'a2')
      pieces_array << pawn2 = Pawn.new('♙', 'b2')
      pieces_array << pawn3 = Pawn.new('♙', 'c2')
      pieces_array << pawn4 = Pawn.new('♙', 'd2')
      pieces_array << pawn5 = Pawn.new('♙', 'e2')
      pieces_array << pawn6 = Pawn.new('♙', 'f2')
      pieces_array << pawn7 = Pawn.new('♙', 'g2')
      pieces_array << pawn8 = Pawn.new('♙', 'h2')
    elsif @player_id.downcase == 'black' || @player_id == 2
      pieces_array << left_rook = Rook.new('♜', 'a8')
      pieces_array << left_knight = Knight.new('♞', 'b8')
      pieces_array << left_bishop = Bishop.new('♝', 'c8')
      pieces_array << queen = Queen.new('♛', 'd8')
      pieces_array << king = King.new('♚', 'e8')
      pieces_array << right_bishop = Bishop.new('♝', 'f8')
      pieces_array << left_knight = Knight.new('♞', 'g8')
      pieces_array << right_rook = Rook.new('♜', 'h8')
      pieces_array << pawn1 = Pawn.new('♟︎', 'a7')
      pieces_array << pawn2 = Pawn.new('♟︎', 'b7')
      pieces_array << pawn3 = Pawn.new('♟︎', 'c7')
      pieces_array << pawn4 = Pawn.new('♟︎', 'd7')
      pieces_array << pawn5 = Pawn.new('♟︎', 'e7')
      pieces_array << pawn6 = Pawn.new('♟︎', 'f7')
      pieces_array << pawn7 = Pawn.new('♟︎', 'g7')
      pieces_array << pawn8 = Pawn.new('♟︎', 'h7')
    end
    pieces_array
  end
end
