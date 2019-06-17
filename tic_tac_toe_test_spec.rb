require './lib/tic_tac_toe_test'

RSpec.describe Game do
    describe ".move" do

      # it "does me twice" do
      #   game = Game.new
      #   expect(game.dometwice(21)).to eql(42)
			# end # describe test

			it "makes a series of moves resulting in victory for player 1" do
				game = Game.new([1,4,2,5,3]) # 1 wins
        expect(game.move).to eql(1)
			end # describe test
			
			it "makes a series of moves resulting in victory for player 2" do
				game = Game.new([2,1,3,5,6,9]) # 2 wins
        expect(game.move).to eql(2)
			end # describe test

		end # describe method
	end # describe class