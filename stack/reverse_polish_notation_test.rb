require_relative 'reverse_polish_notation'
require 'test/unit'

class TestReversePolishNotation < Test::Unit::TestCase

  def test_eval
    calculator = Calculator
    expected = calculator.eval('2,5,+,2,1,+')

    assert_equal(expected, 10)
  end

end