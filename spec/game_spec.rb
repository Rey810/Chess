require '../lib/board.rb'

describe Game do 
    context "a player inputs a starting position" do
        x = Game.new
        x.ready_board

        it "returns true when a correct position is chosen - 1 letter, 1 number" do
            expect(x.move_choice_valid?('B4')).not_to eql(false)
        end

        it "returns false when an incorrect position is chosen - too many characters" do
            expect(x.move_choice_valid?('B44')).not_to eql(true)
        end

        it "returns false when a letter outside (A-H) is chosen" do
            expect(x.move_choice_valid?('I4')).not_to eql(true)
        end

        it "returns false when a number outside (1-8) is chosen" do
            expect(x.move_choice_valid?('H9')).not_to eql(true)
        end

        it "returns false when a number and letter outside the range is chosen" do
            expect(x.move_choice_valid?('H9')).not_to eql(true)
        end

        it "returns the number grid position for a LetterNumber input" do
            expect(x.letter_to_number('C2')).to eql('21')
        end

        it "Position with piece check has NumberNumber value for a LetterNumber input" do
            expect(x.is_any_piece_in_this_position?('A2')).to_not eql('12')
        end

        it "returns true due to position being chosen where a piece is present" do
            expect(x.is_any_piece_in_this_position?('D2')).to eql(true)
        end

        it "returns false due to position being chosen where a piece is NOT present" do
            expect(x.is_any_piece_in_this_position?('D3')).to_not eql(true)
        end
    end

##REMEMBER TO TEST EDGE CASES!!!! AS YOU HAVE NOW DONE FOR CHECKING VALIDITY OF POSITION START CHOICES
end