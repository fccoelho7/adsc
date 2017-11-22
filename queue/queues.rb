class Queue
  def initialize(size)
    @store = []
  end

  def dequeue
    @store.pop
  end

  def enqueue(item)
    @store.unshift(item)
  end

  def show
    @store
  end
end

queue = Queue.new(2)

queue.enqueue(1)
queue.enqueue(2)

queue.dequeue

puts queue.show