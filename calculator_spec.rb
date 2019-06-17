require './lib/calculator'  #=> add this


RSpec.describe Calculator do
    describe "#add" do

      it "returns the sum of two numbers" do
        calculator = Calculator.new
        expect(calculator.add(5, 2)).to eql(7)
			end
			it "returns the sum of more than two numbers" do
					calculator = Calculator.new
					expect(calculator.add(2, 5, 7)).to eql(14)
			end
			it "returns the product of two numbers" do
				calculator = Calculator.new
				expect(calculator.multiply(6, 7)).to eql(42)
			end

			
    end # describe do
  end #describe
  