require './lib/csv_parsing'
require 'test/unit'

# Test of CsvParsing
class TestCsvParsing < Test::Unit::TestCase
  def setup
    @service = CsvParsing.instance
  end

  def test_parse
    vocab = @service.parse('./resources/frequency_list.csv')
    assert_equal(vocab.size, 60_894)
    assert_equal(false, vocab.any? { |e| e.type == 'Unknown' })
    Vocabulary.attributes.each do |attrib|
      assert_equal(false, vocab.any? { |e| e.send(attrib).nil? })
    end
  end
end
