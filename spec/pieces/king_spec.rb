require './lib/pieces/king'

describe WhiteKing do
  subject(:king) { described_class.new('e1') }

end

describe BlackKing do
  subject(:king) { described_class.new('e8') }

end
