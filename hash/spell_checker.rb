require_relative 'hash_table'

class SpellChecker
  attr_accessor :dictionary

  def initialize
    @dictionary = HashTable.new
  end

  def load_dictionary(words)
    words.each do |word|
      @dictionary.set(word)
    end
  end

  def evaluate(phrase)
    words = phrase.downcase.split
    wrong_words = []

    words.each do |word|
      unless @dictionary.get(word)
        wrong_words << word
      end
    end
    
    wrong_words
  end

end