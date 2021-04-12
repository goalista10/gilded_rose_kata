require_relative './convert'

RSpec.describe "Convert" do

	context "Accept INT Output STR" do
		it "1 returns A" do
			expect(convert(1)).to eq("A")
		end

		it "20 returns T" do
			expect(convert(20)).to eq("T")
		end

		it "1000 returns ALL" do
			expect(convert(1000)).to eq("ALL")
		end

		it "26 returns Z" do
			expect(convert(26)).to eq("Z")
		end

		it "100 returns CV" do
			expect(convert(100)).to eq("CV")
		end
	end

end


