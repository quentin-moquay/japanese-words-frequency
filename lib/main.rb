require 'erb'
require 'fileutils'

# local dependencies
require './lib/csv_parsing'
require './lib/vocabulary_writer'

word_limit = ARGV.empty? ? nil : ARGV[0].to_i

# Services
csv_parsing = CsvParsing.instance
writer = VocabularyWriter.instance

# Parse the file
vocabularies = csv_parsing.parse './resources/frequency_list.csv'

# Generate a global report
writer.generate_report(word_limit, vocabularies.clone)

#  Generate one report for each type of grammatical structure
csv_parsing.types.each do |type, _v|
  writer.generate_report(word_limit, vocabularies.clone, type)
end
