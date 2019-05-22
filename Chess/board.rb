require_relative "piece.rb"

class Board
  attr_reader :rows
  def initialize
    
    @rows = Array.new(8) { Array.new(8, NullPiece.new ) }
    (0...8).each do |i|
      (0...8).each do |j|
        if i == 0 || i == 1
          @rows[i][j] = Piece.new(:black)
        elsif i == 6 || i == 7
          @rows[i][j] = Piece.new(:white)
        end
      end
    end
    # @rows[0][0] = nil
  end
  
  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise "Select another position"
    elsif self[end_pos].is_a?(Piece)
      raise "You cannot move here"
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece
    
  end

  def valid_pos?(pos)
    return false if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
    true
  end

end



