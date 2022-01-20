require "./lib/log_parser.rb"

describe LogParser do
	context "when it reads the file" do
		it "returns the first line as a string" do
			expect(LogParser.new("spec/fixtures/game_test.log").first_line).to eq("yes, this is the first line!")
		end
	end

	context "when file does not exist" do
		it "returns an error message" do
			expect{LogParser.new("no_file.log")}.to raise_error("No such file or directory.")
		end
	end
end
