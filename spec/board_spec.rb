require './lib/board'

describe Board do
  subject(:board) { described_class.new }
  describe '#create_squares' do
    context 'when method is called' do
      it 'creates 64 squares' do
        created_squares = board.create_squares
        expect(created_squares.count).to eql(64)
      end

      it 'includes the first square' do
        created_squares = board.create_squares
        first_square = 'a1'
        expect(created_squares.include?(first_square)).to be true
      end

      it 'includes the last square' do
        created_squares = board.create_squares
        last_square = 'h8'
        expect(created_squares.include?(last_square)).to be true
      end
    end
  end
end
