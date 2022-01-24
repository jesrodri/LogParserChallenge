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
    hash_json = { "#{@log_file}": { "lines": count_lines, "players": @players } }
    JSON.pretty_generate(hash_json)
  end

  private

  def count_lines
    IO.readlines(@file).size
  end

  def id_players
    IO.readlines(@file).each do |line|
      if line.include? 'ClientUserinfoChanged'
        client_split = line.split('\\', 2)
        @players << client_split[-1].uniq
      end
    end
  end
end
