require './lib/pieces/pawns'

describe Pawn do
  subject(:pawn) { described_class.new('♙', 'b2') }
  describe '#change_location' do
    context '#when object instance is moved' do
      it 'adds previous location to history' do
        previous_location = 'b2'
        new_location = 'b4'
        pawn.change_location(new_location)
        expect(pawn.history.include?(previous_location)).to be true
      end

      it 'updates location' do
        new_location = 'b4'
        expect{ pawn.change_location(new_location) }.to change{ pawn.current_location }.from('b2').to('b4')
      end
    end
  end

  describe '#find_possible_moves' do
    it 'returns an array' do
      expect(pawn.find_possible_moves).to be_an_instance_of Array
    end

    context 'when the pawn has not been moved yet' do
      it 'allows the pawn to make one move ahead' do
        expect(pawn.find_possible_moves.include?('b3')).to be true
      end

      it 'allows the pawn to make two moves ahead' do
        expect(pawn.find_possible_moves.include?('b4')).to be true
      end

      it 'possible moves include both these possiblities' do
        expect(pawn.find_possible_moves.count).to eql(2)
      end
    end

    context 'when the pawn has been moved' do
      before do
        pawn.change_location('b4')
      end

      it 'only allows the pawn to move forward one square' do
        expect(pawn.find_possible_moves.count).to eql(1)
      end

      it 'allows the pawn to move exactly one square forward' do
        expect(pawn.find_possible_moves.include?('b5')).to be true
      end
    end
  end
end
