class HashItem
  attr_accessor :key, :value, :next

  def initialize(key, value, next_item = nil)
    @key = key
    @value = value
    @next = next_item
  end
end