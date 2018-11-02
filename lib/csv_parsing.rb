require 'singleton'
require 'json'
require './lib/vocabulary'
#
# This class parses the CSV file for extracting an Array of vocabulary.
#
class CsvParsing
  include Singleton
  attr_reader :types
  def initialize
    @types = JSON.parse(File.read('./resources/types.json')) # grammatical structures identification
  end

  def parse(filename)
    vocabularies = []
    File.foreach(filename).with_index do |line, line_num|
      if line_num != 0
        array = line.split ','
        voca = Vocabulary.new
        voca.frequency_position = array[0].to_i
        voca.lexeme = array[1]
        voca.standard_orthography = array[2]
        voca.hiragana_reading = array[3]
        voca.type = type_finder(array[4].strip)
        vocabularies << voca
      end
    end
    vocabularies
  end

  private

  def type_finder(jp_type)
    word_type = 'Unknown'
    @types.each do |k, v|
      word_type = k if v.include? jp_type
    end
    word_type
  end
end
