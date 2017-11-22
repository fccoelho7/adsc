class HashItem
  def initialize(key, value, next = nil)
    @key = key
    @value = value
    @next = next
  end
end

class Hash
  def initialize
    @hash = Array.new(64)
  end

  def put(key, value)
    index = get_index(key)

    if !@hash[index]
      @hash[index] = HashItem.new(key, value)
      return
    end

    if key != @hash[index].key
    end

    current = @hash[index]
    
    while current.next
      if @hash[index].key == key
        @hash[index].value = value
        return
      end
        
      current = current.next
    end
      
    @hash[index] = HashItem.new(key, value, @hash[index])
  end

  def remove(key)

  end

  def get

  end

  private

    def get_index(key)
      key.to_i % 64
    end

end
