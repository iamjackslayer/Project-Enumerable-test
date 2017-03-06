require_relative "../enumerable_test"
describe Enumerable do 
	before(:each) do 
		@names = ["Jack","Marionne","Bambi","Mars"]
		@nums = [2,0,-1,100_000]
		@fruits = {"orange"=>"healthy","banana"=>"nice","apple"=>"good"}
		@floats = [0.0,1.2,1999.8009]
		@objects = [Array.new,String.new,:sym,Proc.new{|n| n}]
	end

	describe "#my_each" do 
		context "given a block" do
			context "given array with names" do 
				it "returns initial array" do 
					expect(@names.my_each{|i| i}).to eql(@names.each{|i| i})
				end
			end

			context "given array with numbers" do 
				it "returns initial array" do 
					expect(@nums.my_each{|a| a}).to eql(@nums.each{|a|a})
				end
			end

			context "given array with hash" do 
				it "returns initial array" do 
					expect(@fruits.my_each{|a|a}).to eql(@fruits.each{|a|a})
				end
			end
			context "given array with various types of objects" do 
				it "returns initial array" do 
					expect(@fruits.my_each{|a|a}).to eql(@fruits.each{|a|a})
				end
			end
		end

		context "when not given a block" do 
			context "when given array with names" do 
				it "returns an Enumerator instance" do 
					expect(@names.my_each).to be_instance_of(Enumerator)
				end
			end
		end
	end

	describe "#my_each_with_index" do 
		context "when given a block" do
			context "given array with floats" do 
				it "returns initial array" do 
					expect(@floats.my_each_with_index{|item,index|  "#{index}: #{item}"}).to eql(@floats.each_with_index{|item,index|  "#{index}: #{item}"})
				end
			end
			context "given array with names" do 
				it "returns initial array" do 
					expect(@names.my_each_with_index{|item,index|  "#{index}: #{item}"}).to eql(@names.each_with_index{|item,index|  "#{index}: #{item}"})
				end
			end
		end

		context "when not given a block" do 
			context "given array with floats" do 
				it "returns initial array" do 
					expect(@floats.my_each_with_index).to be_instance_of(Enumerator)
				end
			end
			context "given array with names" do 
				it "returns initial array" do 
					expect(@names.my_each_with_index).to be_instance_of(Enumerator)
				end
			end
		end
	end	

	describe "#my_select" do 
		context "when given a block" do 
			context "when given array with objects" do 
				it "returns initial array" do 
					expect(@objects.my_select{|item|item.class == Proc}).to eql(@objects.select{|item| item.class == Proc})
				end
			end
		end
		context "when not given a block" do 
			context "when given array with object" do 
				it "returns initial array" do 
					expect(@objects.my_select).to be_instance_of(Enumerator)
				end
			end
		end
	end
	describe "#my_all?" do 
		context "when given a block" do 
			context "when given array with objects" do 
				it "returns initial array" do 
					expect(@names.my_all?{|item|item.class == String}).to eql(@names.all?{|item| item.class == String})
				end
			end
		end
		context "when not given a block" do 
			context "when given array with object" do 
				it "returns initial array" do 
					expect(@names.my_all?).to be_instance_of(Enumerator)
				end
			end
		end
	end

	describe "#my_map" do 
		context "when given a block" do 
			context "when given array with objects" do 
				it "returns initial array" do 
					expect(@nums.my_map{|item|item % 2}).to eql(@nums.map{|item| item % 2})
				end
			end
		end
		context "when not given a block" do 
			context "when given array with object" do 
				it "returns initial array" do 
					expect(@nums.my_map).to be_instance_of(Enumerator)
				end
			end
		end
	end
	describe "#my_inject" do 
		context "when given a block" do 
			context "when given array with objects" do 
				it "returns initial array" do 
					expect(@nums.my_inject{|acc,item| acc + item}).to eql(@nums.inject{|acc,item| acc + item})
				end
			end
		end
		context "when not given a block" do 
			context "when given array with object" do 
				it "returns initial array" do 
					expect(@nums.my_inject).to be_instance_of(Enumerator)
				end
			end
		end
	end
end