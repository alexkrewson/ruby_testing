require './lib/connect_four'

RSpec.describe Game do
	describe ".move" do

		it "creates row of 4 for player 1" do
			game = Game.new([1,1,2,2,3,3,4])
			expect(game.move).to eql(1)
		end # describe test

		it "creates column of 4 for player 1" do
			game = Game.new([1,2,1,2,1,2,3,2])
			expect(game.move).to eql(2)
		end # describe test


		it "creates diagonal of 4 for player 2" do
			game = Game.new([1,2,3,4,6,1,2,3,1,2,6,1])
			expect(game.move).to eql(2)
		end # describe test



	# 	it "makes a series of moves resulting in victory for player 2" do
	# 		game = Game.new([2,1,3,5,6,9]) # 2 wins
	# expect(game.move).to eql(2)
	# 	end # describe test

	end # describe method
end # describe class