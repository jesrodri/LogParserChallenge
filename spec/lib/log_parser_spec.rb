# frozen_string_literal: true

require './lib/log_parser'

describe LogParser do
  describe '#first_line' do
    context 'when file exists' do
      it 'returns the first line as a string' do
        expect(LogParser.new('spec/fixtures/game_test.log').first_line).to eq("yes, this is the first line!\n")
      end
    end
  end

  describe '#generate_json' do
    it 'returns a json file' do
      expected_json = {
        'spec/fixtures/game_test.log': {
          'lines': 5,
          'players': %w[Edward Alice Rosalie Bella]
        }
      }
      expect(LogParser.new('spec/fixtures/game_test.log').generate_json).to eq(JSON.pretty_generate(expected_json))
    end
  end

  context 'when file does not exist' do
    it 'returns an error message' do
      expect { LogParser.new('no_file.log') }.to raise_error('No such file or directory.')
    end
  end
end
