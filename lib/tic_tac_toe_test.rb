class Game

	def initialize(ary)
		@ary = ary
		@board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		@turn = 1
		@finished = false
	end
	
	def move
		# @ary = ary
		showBoard
		while !@finished
			movePrompt
			showBoard
			# puts "return thing: #{checkForWinner}"
			checkForWinner
			@turn += 1
		end
		return @winner

		# return "alex"
	end

	# def dometwice(x)
	# 	2 * x
	# end
	
	private


	def showBoard
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts " #{@board[0]}  #{@board[1]}  #{@board[2]} "
		puts " #{@board[3]}  #{@board[4]}  #{@board[5]} "
		puts " #{@board[6]}  #{@board[7]}  #{@board[8]} "
		puts ""
		puts ""
	end

	def movePrompt
		player = 1 if @turn % 2 != 0
		player = 2 if @turn % 2 == 0
		puts ""
		puts "Player #{player}, make your move."
		puts ""
		makeMove
		while (@board[@thisMove].is_a? String) || ![1, 2, 3, 4, 5, 6, 7, 8, 9].include?(@thisMove + 1)
			showBoard
			puts ""
			puts "INVALID MOVE"
			puts ""
			puts "PLAYER #{player}, PLEASE MAKE A VALID MOVE"
			puts ""
			makeMove
		end
		@board[@thisMove] = ["X", "O"][player - 1]
	end

	def makeMove
		@c ||= 0
		if @ary
			@thisMove = @ary[@c] - 1
			@c += 1
		else
			@thisMove = ""
			@thisMove = gets.chomp.to_i - 1
		end
	end

	def checkForWinner
		@winner = nil
		if @board[0] == "X" && @board[1] == "X" && @board[2] == "X" ||
			 @board[3] == "X" && @board[4] == "X" && @board[5] == "X" ||
			 @board[6] == "X" && @board[7] == "X" && @board[8] == "X" ||

			 @board[0] == "X" && @board[3] == "X" && @board[6] == "X" || 
			 @board[1] == "X" && @board[4] == "X" && @board[7] == "X" ||
			 @board[2] == "X" && @board[5] == "X" && @board[8] == "X" ||

			 @board[0] == "X" && @board[4] == "X" && @board[8] == "X" ||
			 @board[2] == "X" && @board[4] == "X" && @board[6] == "X"
			@winner = 1
			@finished = true
			puts "Player one wins!"
			puts ""
			return "winner 1"
		elsif @board[0] == "O" && @board[1] == "O" && @board[2] == "O" || 
			    @board[3] == "O" && @board[4] == "O" && @board[5] == "O" ||
			    @board[6] == "O" && @board[7] == "O" && @board[8] == "O" ||

			    @board[0] == "O" && @board[3] == "O" && @board[6] == "O" || 
		    	@board[1] == "O" && @board[4] == "O" && @board[7] == "O" ||
	        @board[2] == "O" && @board[5] == "O" && @board[8] == "O" ||

			    @board[0] == "O" && @board[4] == "O" && @board[8] == "O" ||
			    @board[2] == "O" && @board[4] == "O" && @board[6] == "O"
			@winner = 2
			@finished = true
			puts "Player two wins!"
			puts ""
			return "winner 2"
		elsif @board.all? { |spot| spot.is_a? String}
			puts "GAME OVER"
			puts ""
			@winner = 0
			@finished = true
			return "winner 0"
		end
	end


end # class Game



# puts "returned thing: #{Game.move([1,4,2,5,3])}" # 1
# puts "returned thing: #{Game.move([2,1,3,5,6,9])}" # 2
# puts "returned thing: #{Game.move}" #prompts




# game = Game.new([2,1,3,5,6,9]) # 2 wins
# puts "returned thing: #{game.move}"

# game = Game.new([1,4,2,5,3]) # 1 wins
# puts "returned thing: #{game.move}"


