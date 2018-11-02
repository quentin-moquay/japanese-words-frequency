require './lib/vocabulary'

# Templating model
class TemplatingModel
  @attributes = %i[title vocabularies]
  attr_reader(*@attributes)
  attr_writer(*@attributes)
  def initialize(vocabularies, type)
    @vocabularies = vocabularies
    @title = "The #{vocabularies.size} most used #{type || 'words'} in Japanese"
  end

  def give_binding
    binding
  end
end
