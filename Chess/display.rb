require "colorize"
require "colorized_string"
require_relative "cursor.rb"
require_relative "board.rb"
require_relative "piece.rb"


class Display

  attr_reader :board
  attr_writer :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board 
  end

  def render
    system("clear")
    (0...8).each do |i|
      (0...8).each do |j|
        each_tile = []
        piece_color = :black
        if @board[[i,j]].is_a?(NullPiece)
          each_tile << "   "
          piece_color = :black
        else
          each_tile << " B "
        end
        if @cursor.cursor_pos == [i,j]
          print "#{each_tile[0]}".colorize(:color => piece_color, :background => :red)
        elsif (j + i) % 2 == 0
          print "#{each_tile[0]}".colorize(:color => piece_color, :background => :white)
        else
          print "#{each_tile[0]}".colorize(:color => piece_color, :background => :cyan)
        end
      end
      puts
    end
    puts
    # (0...8).each do |i|
    #   (0...8).each do |j|
    #     if i.even?
          
    #     end
    #   end
    #   puts each_line.join('').colorize(:color => :red)

  end

  def displaysampleloop
    while true
    @cursor.get_input
    render
    end
  end

end

b = Board.new
d = Display.new(b)
d.displaysampleloop



