require './lib/pieces/queen'

describe WhiteQueen do
  subject(:queen) { described_class.new('d1') }
end

describe BlackQueen do
  subject(:queen) { described_class.new('d8') }
end
