require_relative "./lib/log_parser.rb"

file = LogParser.new("logs/games.log")
print file.first_line
