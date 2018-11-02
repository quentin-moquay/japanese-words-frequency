require 'singleton'
require './lib/templating_model'

# Creates HTML output
class VocabularyWriter
  include Singleton
  def generate_report(word_limit, vocab, type = nil)
    sub_list = generate_sub_list(word_limit, vocab, type)

    templating_var = TemplatingModel.new(sub_list, type)
    template = ERB.new(File.read('./resources/output.erb.html'))

    filename = generate_new_empty_file(type)
    File.write(filename, template.result(templating_var.give_binding))
    p "See result at : #{filename}"
  end

  private

  def generate_sub_list(word_limit, vocab, type)
    vocab.delete_if { |voc| voc.type != type } unless type.nil?
    vocab = vocab.sort.slice(0, [word_limit, vocab.size].min) if word_limit
    vocab
  end

  def generate_new_empty_file(type)
    dirname = File.dirname('./out')
    FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
    FileUtils.cp('./resources/main.css', './out/main.css') unless File.exist?('./out/main.css')
    type ? "./out/vocabulary_#{type.delete(' ')}.html" : './out/vocabulary.html'
  end
end
