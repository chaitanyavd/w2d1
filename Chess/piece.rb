require_relative "board.rb"


class Piece
  # attr_writer pos
  def initialize
    # @pos = pos
    # @board = board
    # @color = color
  end

end

class NullPiece < Piece

  def initialize
    super
  end


end