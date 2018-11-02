#
# This is PORO for a "vocabulary entity".
# It corresponds to one line in the CSV file.
#
class Vocabulary
  @attributes = %i[frequency_position lexeme standard_orthography hiragana_reading type]
  attr_reader(*@attributes)
  attr_writer(*@attributes)
  def initialize
    @frequency_position, @lexeme, @standard_orthography, @hiragana_reading, @type = ''
  end

  def to_s
    "#{@frequency_position} - #{@lexeme} - #{@standard_orthography} \
    - #{@hiragana_reading} - #{@type}"
  end

  def <=>(other)
    frequency_position <=> other.frequency_position
  end

  class << self
    attr_reader :attributes
  end
end
