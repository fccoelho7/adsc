require_relative 'hash_item'

class HashTable
  attr_accessor :store_size, :store

  def initialize(store_size = 64)
    @store_size = store_size
    @store = Array.new(@store_size)
    @items_limit = 2
    @items_count = 0
  end

  def set(key, value = '')
    index = get_index(key)

    unless @store[index]
      @store[index] = HashItem.new(key, value)
      @items_count += 1
      return
    end

    item = get_item(key)

    if @items_limit == @items_count
      resize!
      @items_count = 0
    end

    if item
      item.value = value
    else
      @store[index] = HashItem.new(key, value, @store[index])
      @items_count += 1
    end

  end

  def remove(key)
    index = get_index(key)
    item = @store[index]

    return unless item

    if item.key == key
      @store[index] = item.next
      return
    end

    previous = item
    item = item.next

    while item
      if item.key == key
        previous.next = item.next
        return
      end

      previous = item
      item = item.next
    end
  end

  def get(key)
    item = get_item(key)
    return item.value if item
  end

  private

    def get_index(key)
      key.to_i(36) % @store_size
    end

    def get_item(key)
      index = get_index(key)
      current = @store[index]

      while current
        return current if current.key == key
        current = current.next
      end

      return nil
    end

    def resize!
      new_store_size = @store_size * 2
      new_store = Array.new(new_store_size)
      i = 0

      while i == @store_size
        item = @store[i].item

        while item
          new_store.set(item.key, item.value)

          return unless item.next

          item = item.next
        end

        i += 1
      end

      @store_size = new_store_size
      @store = new_store
    end

end
