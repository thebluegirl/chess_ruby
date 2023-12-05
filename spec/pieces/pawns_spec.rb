require './lib/pieces/pawns'

describe Pawn do
  subject(:pawn) { described_class.new('♔', 'b2') }
  describe '#move_peice' do
    context '#when object instance is moved' do
      it 'adds previous location to history' do
        previous_location = 'b2'
        new_location = 'b4'
        pawn.move_peice(new_location)
        expect(pawn.history.include?(previous_location)).to be true
      end

      it 'updates location' do
        new_location = 'b4'
        expect{ pawn.move_peice(new_location) }.to change{ pawn.current_location }.from('b2').to('b4')
      end
    end
  end
end
