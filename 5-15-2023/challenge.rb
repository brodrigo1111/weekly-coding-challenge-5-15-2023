require 'linked-list'

def detectIntersect(head1, head2) # finds intersection between two linked lists
    i = head1
    j = head2
    a = [i]
    while i.next != nil do
        a.push(i.next)
        i = i.next
    end
    while j.next != nil do
        for x in a do
            if x == j
                puts "Intersection found at value #{x.data}."
                return
            end    
        end
        j = j.next
    end
    puts "No intersection found."
end

def detectLoop(head) # finds a loop in a linked list
    i = head
    a = [i]
    while i.next != nil do
        for j in a do 
            if j == i.next
                puts "Found loop at value #{j.data}."
                return
            end
        end
        a.push(i.next)
        i = i.next
    end
    puts "No loop found."
end

#
# creating a linked list with a loop in it
#

list = LinkedList::List.new
firstNode = LinkedList::Node.new(1)
loopNode = LinkedList::Node.new(2)
list.push(firstNode)
list.push(loopNode)
list.push(LinkedList::Node.new(3))
list.push(LinkedList::Node.new(4))
list.push(LinkedList::Node.new(5))
loopNode2 = LinkedList::Node.new(6)
loopNode2.next = loopNode
list.push(loopNode2)

# should succeed

detectLoop(firstNode)

#
# creating 2 linked lists with the same node of value 3
#

sameNode = LinkedList::Node.new(3)

list = LinkedList::List.new
list.push(firstNode)
list.push(LinkedList::Node.new(2))
list.push(sameNode)
list.push(LinkedList::Node.new(4))
list.push(LinkedList::Node.new(5))
list.push(LinkedList::Node.new(6))

firstNode2 = LinkedList::Node.new(1)
list2 = LinkedList::List.new
list2.push(firstNode2)
list2.push(LinkedList::Node.new(2))
list2.push(sameNode)
list2.push(LinkedList::Node.new(4))
list2.push(LinkedList::Node.new(5))
list2.push(LinkedList::Node.new(6))

# should find intersection

detectIntersect(firstNode, firstNode2)

#
# creating two separate lists
#

list = LinkedList::List.new
list.push(firstNode)
list.push(LinkedList::Node.new(2))
list.push(LinkedList::Node.new(3))
list.push(LinkedList::Node.new(4))
list.push(LinkedList::Node.new(5))
list.push(LinkedList::Node.new(6))

firstNode2 = LinkedList::Node.new(1)
list2 = LinkedList::List.new
list2.push(firstNode2)
list2.push(LinkedList::Node.new(2))
list2.push(LinkedList::Node.new(3))
list2.push(LinkedList::Node.new(4))
list2.push(LinkedList::Node.new(5))
list2.push(LinkedList::Node.new(6))

# should both fail

detectLoop(firstNode)
detectIntersect(firstNode, firstNode2)



