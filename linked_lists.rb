class Node
  attr_accessor :value, :next

  def initialize(nodeValue, nextNode)
    @value = nodeValue
    @next = nextNode
  end
end

class LinkedList
  def initialize(value)
    @top = Node.new(value, nil)
  end

  def add(value)
    current = @top

    # While next node exists the loop continues
    while current.next
      current = current.next
    end

    # Adds value on the end and set next as null
    current.next = Node.new(value, nil)
  end

  def remove(value)
    current = @top

    # If value is the first, current is the next node
    if current.value == value
      @top = current.next
    end

    # While has next node, continues..
    while current.next

      # If next value is our value, next is the next of our value
      if current.next.value == value
        current.next = current.next.next
      end

      # If has next node, continues..
      if current.next
        current = current.next
      end
      
    end
  end

  def show
    elements = []
    current = @top

    while current.next
      elements << current.value
      current = current.next
    end

    elements << current.value
  end
end

list = LinkedList.new(0)

list.add(1)
list.add(2)
list.add(3)

list.remove(0)

puts list.show