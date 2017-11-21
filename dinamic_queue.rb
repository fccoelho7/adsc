class DinamicQueue
  def initialize(size)
    @queue_size = size
    @store = []
  end

  def enqueue(value)
    if isCrowded?
      realocateQueue!
    end
    
    @store.unshift(value)
  end

  def show!
    puts @queue_size.to_s
    puts @store.to_s
  end

  private

    def isCrowded?
      @store.size == @queue_size
    end

    def realocateQueue!
      @queue_size = @queue_size * 2
    end
end


queue = DinamicQueue.new(2)
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(3)
queue.enqueue(3)
queue.show!