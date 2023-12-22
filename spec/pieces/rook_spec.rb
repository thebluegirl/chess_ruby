require './lib/pieces/rook'

describe WhiteRook do
  subject(:rook) { described_class.new('a1') }
  describe '#change_location' do
    context 'when method is run with a valid argument provided' do
      it 'changes the location of the piece' do
        new_location = 'a5'
        expect{ rook.change_location(new_location) }.to change{ rook.current_location }.from('a1').to('a5')
      end

      it 'adds the previous location to the peice history' do
        new_location = 'a5'
        rook.change_location(new_location)
        expect(rook.history.include?('a1')).to be true
      end
    end
  end

  describe '#find_possible_moves' do
    it 'returns 14 possible moves' do
      expect(rook.find_possible_moves.count).to eql(14)
    end

    it 'returns 7 horizontal moves' do
      horizontal_moves_count = rook.find_possible_moves.count { |move| move.end_with?('1') }
      expect(horizontal_moves_count).to eql(7)
    end

    it 'returns 7 vertical moves' do
      vertical_moves_count = rook.find_possible_moves.count { |move| move.start_with?('a') }
      expect(vertical_moves_count).to eql(7)
    end

    it 'does not include current location' do
      current_location = rook.instance_variable_get(:@current_location)
      expect(rook.find_possible_moves.include?(current_location)).to be false
    end

    it 'includes opposite horizontal end' do
      horizontal_end = 'h1'
      expect(rook.find_possible_moves.include?(horizontal_end)).to be true
    end

    it 'includes opposite vertical end' do
      vertical_end = 'a8'
      expect(rook.find_possible_moves.include?(vertical_end)).to be true
    end
  end
end

describe BlackRook do
  subject(:rook) { described_class.new('h8') }
  describe '#change_location' do
    context 'when method is run with a valid argument provided' do
      it 'changes the location of the piece' do
        new_location = 'h4'
        expect{ rook.change_location(new_location) }.to change{ rook.current_location }.from('h8').to(new_location)
      end

      it 'adds the previous location to the peice history' do
        new_location = 'a8'
        rook.change_location(new_location)
        expect(rook.history.include?('h8')).to be true
      end
    end
  end

  describe '#find_possible_moves' do
    it 'returns 14 possible moves' do
      expect(rook.find_possible_moves.count).to eql(14)
    end

    it 'returns 7 horizontal moves' do
      horizontal_moves_count = rook.find_possible_moves.count { |move| move.end_with?('8') }
      expect(horizontal_moves_count).to eql(7)
    end

    it 'returns 7 vertical moves' do
      vertical_moves_count = rook.find_possible_moves.count { |move| move.start_with?('h') }
      expect(vertical_moves_count).to eql(7)
    end

    it 'does not include current location' do
      current_location = rook.instance_variable_get(:@current_location)
      expect(rook.find_possible_moves.include?(current_location)).to be false
    end

    it 'includes opposite horizontal end' do
      horizontal_end = 'a8'
      expect(rook.find_possible_moves.include?(horizontal_end)).to be true
    end

    it 'includes opposite vertical end' do
      vertical_end = 'h1'
      expect(rook.find_possible_moves.include?(vertical_end)).to be true
    end
  end
end
