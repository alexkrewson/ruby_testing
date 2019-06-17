class Calculator

	def add(a,*b)
		b.reduce(a){ |sum,b| sum += b}
	end

	def multiply(a,*b)
		b.reduce(a){ |prod,b| prod *= b}
		
		
	end
end
	
thing = Calculator.new
puts "2 * 5 * 8 = #{thing.multiply(2,5,8)}"