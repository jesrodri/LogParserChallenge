require 'json'

class LogParser
  def initialize(log_file)
    @log_file = log_file
    raise 'No such file or directory.' unless File.exist?(log_file)

    @file = File.open(log_file)
  end

  def first_line
    first_line = @file.to_a.first
    @file.close
    first_line
  end
  
  def generate_json
    count_lines
    hash_json = { "#{@log_file}": { "lines": @lines } }
    JSON.pretty_generate(hash_json)
  end

  private

  def count_lines
    @lines = IO.readlines(@file).size
    @file.close
   @lines
  end
end
