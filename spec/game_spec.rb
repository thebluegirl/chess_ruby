require './lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#select_piece' do
    context 'when a valid square is entered' do
      it 'returns the piece on the square' do
        player1 = game.instance_variable_get(:@player1)
        allow(player1).to receive(:select_piece).and_return('c2')
        expect(game.select_piece(player1)).to be_an_instance_of Pawn
      end
    end

    context 'when a non-existing square is selected' do
      before do
        player1 = game.instance_variable_get(:@player1)
        allow(player1).to receive(:select_piece).and_return('invalid input', 'a2')
        allow(game).to receive(:puts)
      end

      it 'asks for a valid square' do
        player1 = game.instance_variable_get(:@player1)
        expect(game).to receive(:puts).with('This is not a valid square. Please select a valid square.').once
        game.select_piece(player1)
      end

      it 'returns game piece when valid input is provided' do
        player1 = game.instance_variable_get(:@player1)
        expect(game.select_piece(player1)).to be_an_instance_of Pawn
      end
    end

    context 'when an existing but invalid square is entered' do
      before do
        player1 = game.instance_variable_get(:@player1)
        allow(player1).to receive(:select_piece).and_return('d5', 'g4', 'c2')
        allow(game).to receive(:puts)
      end

      it 'asks for a valid square' do
        player1 = game.instance_variable_get(:@player1)
        expect(game).to receive(:puts).with('You have no pieces on this square. Please select the square with the peice you would like to move.').twice
        game.select_piece(player1)
      end

      it 'returns the piece when a valid square is entered' do
        player1 = game.instance_variable_get(:@player1)
        expect(game.select_piece(player1)).to be_an_instance_of Pawn
      end
    end
  end

  describe '#occupied_square?' do
    it 'returns true if square is occupied' do
      expect(game.occupied_square?('a1')).to be true
    end

    it 'returns false if square is empty' do
      expect(game.occupied_square?('e5')).to be false
    end
  end
end
