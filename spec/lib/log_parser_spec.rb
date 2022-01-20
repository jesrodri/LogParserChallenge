require "./lib/log_parser.rb"

describe "#first_line" do
  context "when file exists" do
    it "returns the first line as a string" do
      expect(LogParser.new("spec/fixtures/game_test.log").first_line).to eq("yes, this is the first line!\n")
    end
  end

  context "when file does not exist" do
    it "returns an error message" do
      expect{LogParser.new("no_file.log")}.to raise_error("No such file or directory.")
    end
  end

  context "#count_lines" do
    it "returns a json file" do
      expected_json = {
        "spec/fixtures/game_test.log": {
          "lines": 1
        }
      }
      expect(LogParser.new("spec/fixtures/game_test.log").count_lines).to eq(JSON.pretty_generate(expected_json))
    end
  end
end
