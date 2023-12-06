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
end
