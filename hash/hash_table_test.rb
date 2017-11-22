require_relative 'hash_table'
require 'test/unit'

class TestHashTable < Test::Unit::TestCase

  def test_set
    hash = HashTable.new(1)
    hash.set('nome', 'Fabio')

    assert_equal(hash.store[0].value, 'Fabio')

    hash.set('nome', 'Xunda')

    assert_equal(hash.store[0].value, 'Xunda')

    hash.set('sobrenome', 'Carvalho')

    assert_equal(hash.store[0].value, 'Carvalho')
    assert_equal(hash.store[0].next.value, 'Xunda')
  end
 
  def test_get
    hash = HashTable.new(1)
    hash.set('nome', 'Fabio')

    assert_equal(hash.get('nome'), 'Fabio')
  end

  def test_remove
    hash = HashTable.new(1)
    hash.set('nome', 'Fabio')
    hash.remove('xunda')

    assert_equal(hash.get('nome'), 'Fabio')

    hash.remove('nome')

    assert_equal(hash.get('nome'), nil)
  end
 
end