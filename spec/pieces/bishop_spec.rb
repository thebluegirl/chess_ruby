require './lib/pieces/bishop'

describe WhiteBishop do
  subject(:bishop) { described_class.new('c1') }

end

describe BlackBishop do
  subject(:bishop) { described_class.new('f8') }

end
