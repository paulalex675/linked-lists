class LinkedList
  def initialize
    @head = nil
  end

  def prepend(value)
    if @head
      @head, @head.next = Node.new(value), @head
    else
      @head = Node.new(value)
    end
  end

  def append_after(target, value)
    node = find(target)

    return unless node 

    old_next       = node.next
    node_next      = Node.new(value)
    node.next.next = old_next
  end

  def find(value)
    node = @head 

    return node if node.value == value
    return false if !node.next

    while (node = node.next) 
        return node if node.value == value
    end
  end

  def delete(value)
    if @head.value == value
        @head = @head.next
        return
    end

    node      = find_before(value)
    node.next = node.next.next
  end

  def find_before(value)
    node = @head 

    return false if !node.next
    return node if node.next.value == value

    while (node = node.next) 
        return node if node.value == value
    end
  end

  def print
    node = @head
    puts node

    while (node = node.next)
        puts node
    end
  end

  def size
    list_size = 0
    node = @head
    while node = node.next
        list_size += 1
    return
      puts list_size
    end
  end
end
  
class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value)
    @value = value
    @value = nil
    @next = nil
  end
end

list = LinkedList.new
list.prepend(10)
list.prepend(20)
list.prepend(30)

list.append_after(10, 15)
list.append_after(20, 25)

list.print

