class Stack
  def initialize
    @store = []
  end

  def push(value)
    @store << value
  end

  def pop
    @store.pop
  end

  def show
    @store
  end
end

stack = Stack.new

stack.push(1)
stack.push(2)
stack.push(3)

stack.pop

puts stack.show