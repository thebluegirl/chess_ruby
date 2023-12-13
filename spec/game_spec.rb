require './lib/game'

describe Game do
  describe '#validate_selected_square' do
    subject(:game) { described_class.new }

    context 'when a non-existing square is selected' do
      before do
        player1 = game.instance_variable_get(:@player1)
        allow(player1).to receive(:select_piece).and_return('invalid input', 'a2')
        allow(game).to receive(:puts)
      end

      it 'asks for a valid square' do
        player1 = game.instance_variable_get(:@player1)
        expect(game).to receive(:puts).with('This is not a valid square. Please select a valid square.').once
        game.validate_selected_square(player1)
      end

      it 'returns game piece when valid input is provided' do
        player1 = game.instance_variable_get(:@player1)
        expect(game.validate_selected_square(player1)).to be_an_instance_of Pawn
      end
    end
  end
end
