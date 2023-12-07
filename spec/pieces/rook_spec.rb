require './lib/pieces/rook'

describe Rook do
  subject(:rook) { described_class.new('♖', 'a1') }
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
    it 'returns an array' do
      expect(rook.find_possible_moves).to be_an_instance_of Array
    end

    it 'returns an array of 14' do
      expect(rook.find_possible_moves.count).to eql(14)
    end

    it 'includes vertical opposite end' do
      expect(rook.find_possible_moves.include?('a8')).to be true
    end

    it 'includes horizontal opposite end' do
      expect(rook.find_possible_moves.include?('h1')).to be true
    end
  end
end
