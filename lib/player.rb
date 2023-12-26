require './lib/pieces/pieces'

class Player
  def initialize(player_id)
    @player_id = player_id
    @pieces = create_pieces
  end

  def create_pieces
    pieces_array = []

    if @player_id.downcase == 'white'
      pieces_array << left_rook = WhiteRook.new('a1')
      pieces_array << left_knight = WhiteKnight.new('b1')
      pieces_array << left_bishop = WhiteBishop.new('c1')
      pieces_array << queen = WhiteQueen.new('d1')
      pieces_array << king = WhiteKing.new('e1')
      pieces_array << right_bishop = WhiteBishop.new('f1')
      pieces_array << left_knight = WhiteKnight.new('g1')
      pieces_array << right_rook = WhiteRook.new('h1')
      pieces_array << pawn1 = WhitePawn.new('a2')
      pieces_array << pawn2 = WhitePawn.new('b2')
      pieces_array << pawn3 = WhitePawn.new('c2')
      pieces_array << pawn4 = WhitePawn.new('d2')
      pieces_array << pawn5 = WhitePawn.new('e2')
      pieces_array << pawn6 = WhitePawn.new('f2')
      pieces_array << pawn7 = WhitePawn.new('g2')
      pieces_array << pawn8 = WhitePawn.new('h2')
    elsif @player_id.downcase == 'black'
      pieces_array << left_rook = BlackRook.new('a8')
      pieces_array << left_knight = BlackKnight.new('b8')
      pieces_array << left_bishop = BlackBishop.new('c8')
      pieces_array << queen = BlackQueen.new('d8')
      pieces_array << king = BlackKing.new('e8')
      pieces_array << right_bishop = BlackBishop.new('f8')
      pieces_array << left_knight = BlackKnight.new('g8')
      pieces_array << right_rook = BlackRook.new('h8')
      pieces_array << pawn1 = BlackPawn.new('a7')
      pieces_array << pawn2 = BlackPawn.new('b7')
      pieces_array << pawn3 = BlackPawn.new('c7')
      pieces_array << pawn4 = BlackPawn.new('d7')
      pieces_array << pawn5 = BlackPawn.new('e7')
      pieces_array << pawn6 = BlackPawn.new('f7')
      pieces_array << pawn7 = BlackPawn.new('g7')
      pieces_array << pawn8 = BlackPawn.new('h7')
    end
    pieces_array
  end

  def select_piece
    puts 'Select the square you would like to pick a piece from'
    player_input = gets.chomp.strip.downcase
  end

  attr_reader :pieces, :player_id

  # protected


end
