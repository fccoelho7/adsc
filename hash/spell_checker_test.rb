require 'test/unit'
require_relative 'spell_checker'

class TestSpellChecker < Test::Unit::TestCase

  def test_load_dictionary
    checker = SpellChecker.new
    checker.load_dictionary(['car', 'bike'])

    assert_equal(checker.dictionary.get('car'), '')
    assert_equal(checker.dictionary.get('bike'), '')
    assert_equal(checker.dictionary.get('plane'), nil)
  end

  def test_evaluate
    checker = SpellChecker.new
    checker.load_dictionary(['car', 'bike'])
    expected = checker.evaluate('car is not a bike')

    assert_equal(expected, ['is', 'not', 'a'])
  end

end