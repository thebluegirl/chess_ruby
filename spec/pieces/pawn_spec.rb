require './lib/pieces/pawn'

describe Pawn do
  subject(:pawn) { described_class.new('♙', 'b2') }

  describe '#change_location' do
    context 'when method is run with a valid argument provided' do
      it 'changes the location of the piece' do
        new_location = 'b4'
        expect{ pawn.change_location(new_location) }.to change{ pawn.current_location }.from('b2').to('b4')
      end

      it 'adds the previous location to the peice history' do
        new_location = 'b4'
        pawn.change_location(new_location)
        expect(pawn.history.include?('b2')).to be true
      end
    end

    context 'when method has been run multiple times' do
      before do
        pawn.change_location('b4')
        pawn.change_location('b5')
      end

      it 'stores the history' do
        expect(pawn.history.count).to eql(2)
      end

      it 'contains first move history' do
        expect(pawn.history.include?('b2')).to be true
      end

      it 'contains second move history' do
        expect(pawn.history.include?('b4')).to be true
      end

      it 'changes the location of the piece' do
        new_location = 'b6'
        expect{ pawn.change_location(new_location) }.to change{ pawn.current_location }.from('b5').to(new_location)
      end
    end
  end

  describe '#find_possible_moves' do
    context 'when pawn has not been moved' do
      it 'returns an array' do
        expect(pawn.find_possible_moves).to be_an_instance_of Array
      end

      it 'returns two possible options' do
        expect(pawn.find_possible_moves.count).to eql(2)
      end

      it 'includes b4' do
        expect(pawn.find_possible_moves.include?('b4')).to be true
      end
    end

    context 'when pawn has been moved' do
      before do
        pawn.change_location('b4')
      end

      it 'returns an array' do
        expect(pawn.find_possible_moves).to be_an_instance_of Array
      end

      it 'returns two possible options' do
        expect(pawn.find_possible_moves.count).to eql(1)
      end

      it 'includes b5' do
        expect(pawn.find_possible_moves.include?('b5')).to be true
      end

    end
  end
end
