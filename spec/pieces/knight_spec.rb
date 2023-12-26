require './lib/pieces/knight'

describe WhiteKnight do
  subject(:knight) { described_class.new('g1') }
end

describe BlackKnight do
  subject(:knight) { described_class.new('b8') }
end
