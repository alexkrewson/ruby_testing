require './enumerable_test'

RSpec.describe 
    describe "#my_select" do

      it "selects elements from an array based on selection criteria" do
				expect([1,2,3].my_select { |num| num.even? }).to eql([2])
			end # describe method

		end # name method

RSpec.describe 
describe "#my_all?" do

	it "determines if all elements of an array meet the criteria" do
		expect([1,2,3].my_all? { |num| num.even? }).to eql(false)
	end# describe method

end # name method

RSpec.describe 
describe "#my_any?" do

	it "determines if any of the elements of an array meet the criteria" do
		expect([1,2,3].my_any? { |num| num.even? }).to eql(true)
	end# describe method

end # name method

RSpec.describe 
describe "#my_none?" do

	it "determines if none of the elements of an array meet the criteria" do
		expect([1,2,3].my_none? { |num| num > 4 }).to eql(true)
	end# describe method

end # name method

RSpec.describe 
describe "#my_count" do

	it "counts the elements of an array that meet the criteria" do
		expect([1,2,3,6,8].my_count { |num| num.even? }).to eql(3)
	end# describe method

end # name method

RSpec.describe 
describe "#my_map" do

	it "returns an array after performing a block on each element of an input array" do
		expect([1,2,3].my_map { |num| num * 2 }).to eql([2,4,6])
	end# describe method

end # name method








