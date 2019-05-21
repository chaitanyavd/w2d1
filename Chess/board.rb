require_relative "piece.rb"

class Board
  attr_reader :rows
  def initialize
    
    @rows = Array.new(8) { Array.new(8, NullPiece ) }
    # @rows.each_with_index do |row, i|
    #   row.each do |pos|
    #     if i == 0 || i == 1 || i == 6 || i == 7
    #       pos = Piece.new
    #     end
    #   end
    # end
    @rows[0][0] = nil
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

  # def move_piece(start_pos, end_pos)
  #   if @rows[start_pos[0]][start_pos[1]].is_a?(NullPiece)
  #     raise "There is no piece at #{start_pos}"
  #   end
  #   if @rows[end_pos[0]][end_pos[1]].is_a?(Piece)
  #     raise "The piece cannot move to: #{start_pos}"
  #   end
  # end

end



