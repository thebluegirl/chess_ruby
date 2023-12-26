require './lib/player'

describe Player do
  describe '#create_pieces' do
    context 'if player id is white, i.e. the player is first' do
      subject(:player) { described_class.new('white') }

      it 'returns an array with 16 objects' do
        expect(player.create_pieces.count).to eql(16)
      end

      it 'has 8 pawns' do
        pawn_count = player.create_pieces.count { |piece| piece.class == WhitePawn}
        expect(pawn_count).to eql(8)
      end

      it 'has 1 queen and 1 king' do
        royal_count = player.create_pieces.count { |piece| piece.class == WhiteKing || piece.class == WhiteQueen }
        expect(royal_count).to eql(2)
      end

      it 'has 2 rooks' do
        rook_count = player.create_pieces.count { |piece| piece.class == WhiteRook}
        expect(rook_count).to eql(2)
      end

      it 'has 2 bishops' do
        bishop_count = player.create_pieces.count { |piece| piece.class == WhiteBishop}
        expect(bishop_count).to eql(2)
      end

      it 'has 2 knights' do
        knight_count = player.create_pieces.count { |piece| piece.class == WhiteKnight}
        expect(knight_count).to eql(2)
      end
    end

    context 'if player id is blace, i.e. the player is second' do
      subject(:player) { described_class.new('black') }

      it 'returns an array with 16 objects' do
        expect(player.create_pieces.count).to eql(16)
      end

      it 'has 8 pawns' do
        pawn_count = player.create_pieces.count { |piece| piece.class == BlackPawn}
        expect(pawn_count).to eql(8)
      end

      it 'has 1 queen and 1 king' do
        royal_count = player.create_pieces.count { |piece| piece.class == BlackKing || piece.class == BlackQueen }
        expect(royal_count).to eql(2)
      end

      it 'has 2 rooks' do
        rook_count = player.create_pieces.count { |piece| piece.class == BlackRook}
        expect(rook_count).to eql(2)
      end

      it 'has 2 bishops' do
        bishop_count = player.create_pieces.count { |piece| piece.class == BlackBishop}
        expect(bishop_count).to eql(2)
      end

      it 'has 2 knights' do
        knight_count = player.create_pieces.count { |piece| piece.class == BlackKnight}
        expect(knight_count).to eql(2)
      end
    end
  end
end
