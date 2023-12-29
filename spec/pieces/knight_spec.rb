require './lib/pieces/knight'

describe WhiteKnight do
  subject(:knight) { described_class.new('g1') }
  describe '#find_possible_moves' do
    context 'when knight is in the middle of the board' do
      subject(:knight) { described_class.new('e5') }
      it 'has 8 possible moves' do
        expect(knight.find_possible_moves.count).to eql(8)
      end

      it 'includes d7' do
        expect(knight.find_possible_moves.include?('d7')).to be true
      end

      it 'includes c4' do
        expect(knight.find_possible_moves.include?('c4')).to be true
      end

      it 'includes f3' do
        expect(knight.find_possible_moves.include?('f3')).to be true
      end

      it 'includes g6' do
        expect(knight.find_possible_moves.include?('g6')).to be true
      end
    end

    context 'when knight is at edge of board' do
      subject(:knight) { described_class.new('a1') }

      it 'has 2 possible moves' do
        expect(knight.find_possible_moves.count).to eql(2)
      end

      it 'includes b3' do
        expect(knight.find_possible_moves.include?('b3')).to be true
      end

      it 'includes c2' do
        expect(knight.find_possible_moves.include?('c2')).to be true
      end
    end

    context 'when knight is close to edge of board' do
      subject(:knight) { described_class.new('b2') }
      it 'has 4 possible moves' do
        expect(knight.find_possible_moves.count).to eql(4)
      end

      it 'includes c4' do
        expect(knight.find_possible_moves.include?('c4')).to be true
      end

      it 'includes a4' do
        expect(knight.find_possible_moves.include?('a4')).to be true
      end

      it 'includes d1' do
        expect(knight.find_possible_moves.include?('d1')).to be true
      end

      it 'includes d3' do
        expect(knight.find_possible_moves.include?('d3')).to be true
      end
    end
  end
end

describe BlackKnight do
  subject(:knight) { described_class.new('b8') }

  describe '#find_possible_moves' do
    context 'when knight is in the middle of the board' do
      subject(:knight) { described_class.new('d5') }
      it 'has 8 possible moves' do
        expect(knight.find_possible_moves.count).to eql(8)
      end

      it 'includes e7' do
        expect(knight.find_possible_moves.include?('e7')).to be true
      end

      it 'includes b4' do
        expect(knight.find_possible_moves.include?('b4')).to be true
      end

      it 'includes f4' do
        expect(knight.find_possible_moves.include?('f4')).to be true
      end

      it 'includes c3' do
        expect(knight.find_possible_moves.include?('c3')).to be true
      end
    end

    context 'when knight is at edge of board' do
      subject(:knight) { described_class.new('h8') }

      it 'has 2 possible moves' do
        expect(knight.find_possible_moves.count).to eql(2)
      end

      it 'includes f7' do
        expect(knight.find_possible_moves.include?('f7')).to be true
      end

      it 'includes g6' do
        expect(knight.find_possible_moves.include?('g6')).to be true
      end
    end

    context 'when knight is close to edge of board' do
      subject(:knight) { described_class.new('g7') }
      it 'has 4 possible moves' do
        expect(knight.find_possible_moves.count).to eql(4)
      end

      it 'includes e8' do
        expect(knight.find_possible_moves.include?('e8')).to be true
      end

      it 'includes e6' do
        expect(knight.find_possible_moves.include?('e6')).to be true
      end

      it 'includes h5' do
        expect(knight.find_possible_moves.include?('h5')).to be true
      end

      it 'includes f5' do
        expect(knight.find_possible_moves.include?('f5')).to be true
      end
    end
  end
end
