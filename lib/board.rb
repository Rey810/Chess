#                   NB
#   1. Prevent players from making illegal moves
#   2. Declare check/checkmate
#   3. Save board at any time
#   4. Use RSpec where necessary
#   5. Keep Classes Modular
#   6. Methods must do only 1 thing
#   7. Restricting pieces to their colour can just be accounted for in a piece's valid moves


class Piece
    #generate a piece with a colour and type
    attr_accessor :type
    attr_reader :colour   

    def initialize(type, colour)
        @type = type
        @colour = colour
    end
    
end

class King
    attr_accessor :check_count, :checkmate
    attr_reader :type, :colour

    def initialize(type, colour)
        @type = type
        @colour = colour
        @check_count = 0
        @checkmate = false
    end
end

class Board
    #generate a board (8*8)
    attr_accessor :game_board
    def initialize
        @game_board = Array.new(8) { Array.new(8) { nil } }
    end

    def display_board
        puts 
        col_position = [:A, :B, :C, :D, :E, :F, :G, :H]
        row_position = (1..8).to_a
        (@game_board[0].length - 1).downto(0) do |row|
            print "  #{row_position[row]}  " 
            @game_board.length.times do |col|
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
    attr_accessor :board
    #populate the board with pieces
    def initialize  
        @board = Board.new 
    end

    def ready_board
        @board.game_board.length.downto(0) do |col|
            @board.game_board[1][col] = Piece.new("P", :white)
        end

        @board.game_board.length.downto(0) do |col|
            @board.game_board[6][col] = Piece.new("P", :black)
        end

        @board.game_board[7][0] = Piece.new('R', :black)
        @board.game_board[7][7] = Piece.new('R', :black)
        @board.game_board[7][1] = Piece.new('H', :black)
        @board.game_board[7][6] = Piece.new('H', :black)
        @board.game_board[7][2] = Piece.new('B', :black)
        @board.game_board[7][5] = Piece.new('B', :black)
        @board.game_board[7][3] = Piece.new('Q', :black)
        @board.game_board[7][4] = King.new('K', :black)

        @board.game_board[0][0] = Piece.new('R', :white)
        @board.game_board[0][7] = Piece.new('R', :white)
        @board.game_board[0][1] = Piece.new('H', :white)
        @board.game_board[0][6] = Piece.new('H', :white)
        @board.game_board[0][2] = Piece.new('B', :white)
        @board.game_board[0][5] = Piece.new('B', :white)
        @board.game_board[0][3] = Piece.new('Q', :white)
        @board.game_board[0][4] = King.new('K', :white)

    end

    def display_current_game_board

        puts 
        col_position = [:A, :B, :C, :D, :E, :F, :G, :H]
        row_position = (1..8).to_a
        (@board.game_board[0].length - 1).downto(0) do |row|
            print "  #{row_position[row]}  " 
            @board.game_board.length.times do |col|
                print " | "
                if (@board.game_board[row][col]) == nil 
                    print " " 
                else print "#{(@board.game_board[row][col]).type} #{(@board.game_board[row][col]).colour}"
                end
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




    #player selects piece to move
    def starting_position_choice
        puts "Please choose a position from which to move"
        @starting_position = gets.upcase!.chomp.strip
        starting_position_choice_valid?(@starting_position) && is_game_piece_in_this_position?(@starting_position) ? @starting_position : starting_position_choice
    end

    def starting_position_choice_valid?(start)
        start =~ /^[a-h]{1}[1-8]{1}$/i ? true : false
    end

    def is_game_piece_in_this_position?(start)
        number_positions = letter_to_number(start)
        (@board.game_board[number_positions[1].to_i - 1][number_positions[0].to_i]).nil? ? false : true 
    end

    def letter_to_number(start)
        letters = [
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
        ]

        letters.each_with_index do |letter, index|
            letter == start[0] ? start[0] = index.to_s : next
        end
        start
    end


    def move_piece
        #select piece at valid starting position
        #identify piece
        #inform player of selected piece ("Where would you like to move the Pawn?")
        #
            #call on valid moves
    end







    def play
        ready_board
=begin       loop do
            display_current_game_board
            #player selects piece
            start_select
            #player chooses position to move to
            move_select #perform all the checks:    the validity of the move for the current piece type
        end
=end
    end
end

x = Game.new
x.ready_board
x.display_current_game_board
x.starting_position_choice