require './lib/player'

describe Player do
  describe '#create_pieces' do
    context 'if player id is white, i.e. the player is first' do
      subject(:player) { described_class.new('white') }

      it 'returns an array with 16 objects' do
        expect(player.create_pieces.count).to eql(16)
      end

      it 'has 8 pawns' do
        pawn_count = player.create_pieces.count { |piece| piece.class == Pawn}
        expect(pawn_count).to eql(8)
      end

      it 'has 1 queen and 1 king' do
        royal_count = player.create_pieces.count { |piece| piece.class == King || piece.class == Queen }
        expect(royal_count).to eql(2)
      end

      it 'has 2 rooks' do
        rook_count = player.create_pieces.count { |piece| piece.class == Rook}
        expect(rook_count).to eql(2)
      end

      it 'has 2 bishops' do
        bishop_count = player.create_pieces.count { |piece| piece.class == Bishop}
        expect(bishop_count).to eql(2)
      end

      it 'has 2 knights' do
        knight_count = player.create_pieces.count { |piece| piece.class == Knight}
        expect(knight_count).to eql(2)
      end
    end

    context 'if player id is blace, i.e. the player is second' do
      subject(:player) { described_class.new('black') }

      it 'returns an array with 16 objects' do
        expect(player.create_pieces.count).to eql(16)
      end

      it 'has 8 pawns' do
        pawn_count = player.create_pieces.count { |piece| piece.class == Pawn}
        expect(pawn_count).to eql(8)
      end

      it 'has 1 queen and 1 king' do
        royal_count = player.create_pieces.count { |piece| piece.class == King || piece.class == Queen }
        expect(royal_count).to eql(2)
      end

      it 'has 2 rooks' do
        rook_count = player.create_pieces.count { |piece| piece.class == Rook}
        expect(rook_count).to eql(2)
      end

      it 'has 2 bishops' do
        bishop_count = player.create_pieces.count { |piece| piece.class == Bishop}
        expect(bishop_count).to eql(2)
      end

      it 'has 2 knights' do
        knight_count = player.create_pieces.count { |piece| piece.class == Knight}
        expect(knight_count).to eql(2)
      end
    end
  end
end
