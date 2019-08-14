#                   NB
#   1. Prevent players from making illegal moves
#   2. Declare check/checkmate
#   3. Save board at any time
#   4. Use RSpec where necessary
#   5. Keep Classes Modular
#   6. Methods must do only 1 thing
#   7. Restricting pieces to their colour can just be accouted for in a piece's valid moves


class Piece
    #generate a piece with a colour and type
    attr_accessor :type
    attr_reader :colour   

    def initialize(type, colour)
        @type = type
        @colour = colour
    end
    
end

class Board
    #generate a board (8*8)
    attr_accessor :board
    def initialize
        @board = Array.new(8) { Array.new(8) { nil } }
    end

    def display_board
        puts 
        col_position = [:A, :B, :C, :D, :E, :F, :G, :H]
        row_position = (1..8).to_a
        (@board[0].length - 1).downto(0) do |row|
            print "  #{row_position[row]}  " 
            @board.length.times do |col|
                print " | "
                print "#{row + 1}#{col_position[col]}"
            end
            puts
            print "      ----------------------------------------"
            puts      
        end
        print "       "
        col_position.length.times { |col| print "  #{col_position[col]}  " }
        puts
        puts
    end
end

class Game
    #populate the board with pieces
end

x = Piece.new("k", :white)                      #use a Symbol for colour because symbols are meant to be identifiers. It's immutable, instantiated faster
 y = Board.new
 y.display_board