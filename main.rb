# frozen_string_literal: true

require_relative './lib/log_parser'

file = LogParser.new('games.log')
print file.first_line
puts file.generate_json
