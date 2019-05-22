require_relative "board.rb"


class Piece
   attr_reader :color
  def initialize(color)
    # @pos = pos
    # @board = board
    @color = color
  end

end

class NullPiece < Piece

  def initialize
    super(:nil)
  end


end