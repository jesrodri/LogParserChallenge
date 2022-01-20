require_relative "./lib/log_parser.rb"

file = LogParser.new("./spec/fixtures/games.log")
print file.first_line
