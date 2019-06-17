class Game

    def initialize(ary = nil)
		@ary = ary
		@board = [1,2,3,4,5,6,7," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "]
		@turn = 1
		@winner = nil
		@finished = false
		@invalid_move = 0
		@moves = []
		@c1 = 0
		@c2 = 0
		@c3 = 0
		
		@height = 0
    end

    def move
		showBoard
		while !@finished
			movePrompt
			showBoard
			checkForWinner
			@turn += 1
		end
		return @winner
	end

	
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
		puts "|#{@board[0]}|#{@board[1]}|#{@board[2]}|#{@board[3]}|#{@board[4]}|#{@board[5]}|#{@board[6]}|"
		puts "|#{@board[7]}|#{@board[8]}|#{@board[9]}|#{@board[10]}|#{@board[11]}|#{@board[12]}|#{@board[13]}|"
		puts "|#{@board[14]}|#{@board[15]}|#{@board[16]}|#{@board[17]}|#{@board[18]}|#{@board[19]}|#{@board[20]}|"
		puts "|#{@board[21]}|#{@board[22]}|#{@board[23]}|#{@board[24]}|#{@board[25]}|#{@board[26]}|#{@board[27]}|"
		puts "|#{@board[28]}|#{@board[29]}|#{@board[30]}|#{@board[31]}|#{@board[32]}|#{@board[33]}|#{@board[34]}|"
		puts "|#{@board[35]}|#{@board[36]}|#{@board[37]}|#{@board[38]}|#{@board[39]}|#{@board[40]}|#{@board[41]}|"
		puts "|#{@board[42]}|#{@board[43]}|#{@board[44]}|#{@board[45]}|#{@board[46]}|#{@board[47]}|#{@board[48]}|"
		puts "---------------"
		puts ""
		puts ""
	end

	def movePrompt
		player = 1 if @turn % 2 != 0
		player = 2 if @turn % 2 == 0
		puts ""
		puts "Player #{player}, make your move."
		puts ""
		puts "@moves: #{@moves}"
		makeMove
		while @invalid_move == 1
			showBoard
			puts ""
			puts "INVALID MOVE"
			puts ""
			puts "PLAYER #{player}, PLEASE MAKE A VALID MOVE"
			puts ""
			makeMove
		end
		@moves.push(@thisMove + 1)
		@height = histogram(@moves)[@thisMove + 1]
		@thisMove = @thisMove + 49 - @height * 7

		@board[@thisMove] = ["X", "O"][player - 1]
	end

	def makeMove
		
		if @ary && @c3 < @ary.length
			@thisMove = @ary[@c3] - 1
			@c3 += 1
		else
			@thisMove = gets.chomp.to_i - 1
		end
			valid_move?(@thisMove + 1)
			@thisMove
	end
    
	def valid_move?(move)
			
		if [1,2,3,4,5,6,7].include?(move)
				@invalid_move = 0
		else
				@invalid_move = 1
		end
	end

	def histogram(input_array)
    hash = input_array.reduce({}) do |quantity, item|
        quantity[item] ||= 0
        quantity[item] += 1
				quantity
			end		
	end


	def checkForWinner
		@winner = nil
		@row = [[],[],[],[],[],[],[]]
		while @c2 < 7
			while @c1 < 7
				@row[@c2].push(@board[@c1 + @c2 * 7])
				@c1 += 1
			end
			if @row[@c2].join("").include?('XXXX')
				@winner = 1
				@finished = true
				puts "Player one wins!"
				puts ""
			elsif @row[@c2].join("").include?('OOOOO')
				@winner = 2
				@finished = true
				puts "Player two wins!"
				puts ""
			end
			@c2 += 1
			@c1 = 0
		end
		@c2 = 0

		@column = [[],[],[],[],[],[],[]]
		while @c2 < 7
			while @c1 < 7
				@column[@c2].push(@board[@c2 + @c1 * 7])
				@c1 += 1
			end

			if @column[@c2].join("").include?('XXXX')
				@winner = 1
				@finished = true
				puts "Player one wins!"
				puts ""
			elsif @column[@c2].join("").include?('OOOO')
				@winner = 2
				@finished = true
				puts "Player two wins!"
				puts ""
			end

			@c2 += 1
			@c1 = 0
		end
		@c2 = 0

		diag = []
		diag[0] = makeDiagonal(21,4)
		diag[1] = makeDiagonal(14,5)
		diag[2] = makeDiagonal(7,6)
		diag[3] = makeDiagonal(8,6)
		diag[4] = makeDiagonal(9,5)
		diag[5] = makeDiagonal(10,4)
		diag[6] = makeDiagonal2(10,4)
		diag[7] = makeDiagonal2(11,5)
		diag[8] = makeDiagonal2(12,6)
		diag[9] = makeDiagonal2(13,6)
		diag[10] = makeDiagonal2(20,5)
		diag[11] = makeDiagonal2(27,4)
		
		c = 0
		while c < 12

			if diag[c].join("").include?('XXXX')
				@winner = 1
				@finished = true
				puts "Player one wins!"
				puts ""
			elsif diag[c].join("").include?('OOOO')
				@winner = 2
				@finished = true
				puts "Player two wins!"
				puts ""
			end
			c += 1
		end
	end # checkForWinner

	def makeDiagonal(origin,diaglength)
		c = 0
		diagonal = []
		while c < diaglength
				diagonal[c] = @board[origin + c * 8]
				c += 1
		end
		diagonal
	end

	def makeDiagonal2(origin,diaglength)
		c = 0
		diagonal = []
		while c < diaglength
				diagonal[c] = @board[origin + c * 6]
				c += 1
		end
		diagonal
	end



end # class Game

# game = Game.new([1,1,2,2,3,3,4])
# game = Game.new([1,2,1,2,1,2,1])
# game = Game.new([1,2,3,4,5,6,7,1,2,3,4,5,6,7,1,2,3,4,5,6,7,1,2,3,4,5,6,7,1,2,3,4,5,6,7,1,2,3,4,5,6,7])
# [1,2,1,2,1,2,3,2]
# game = Game.new([1,2,3,4,6,1,2,3,1,2,6,1])
# game = Game.new
# puts "final puts: #{game.move}"