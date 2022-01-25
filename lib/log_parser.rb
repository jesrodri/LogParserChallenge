# frozen_string_literal: true

require 'json'

# Parser to get data from game log file
class LogParser
  def initialize(log_file)
    @log_file = log_file
    raise 'No such file or directory.' unless File.exist?(log_file)

    @file = File.open(log_file)
    @players = []
  end

  def first_line
    first_line = @file.to_a.first
    @file.close
    first_line
  end

  def generate_json
    parse_players
    game_info = { "#{@log_file}": { "lines": count_lines, "players": @players } }
    JSON.pretty_generate(game_info)
  end

  private

  def count_lines
    IO.readlines(@file).size
  end

  def get_player(line)
    line.split(' n\\').last.split('\\t').first
  end

  def parse_players
    IO.readlines(@file).each do |line|
      @players << get_player(line) if line.include? 'ClientUserinfoChanged'
    end
    @players.uniq!
  end
end
