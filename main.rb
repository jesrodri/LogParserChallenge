require_relative "./lib/log_parser.rb"

file = LogParser.new("games.log")
print file.first_line
puts file.count_lines
