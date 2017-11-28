//: Playground - noun: a place where people can play

import UIKit


public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    
    public var last: Node? {
        if var node = head {
            // Goes through list until node.next is equal to nil
            while let next = node.next {
                node = next
            }
            return node
        } else {
            return nil
        }
    }
    
    public func append(value: T) {
        // Creates a new Node
        let newNode = Node(value: value)
        // Ask for last node. If valid, set next and previous pointers
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        // If no existing node, set the head to the node created
        } else {
            head = newNode
        }
    }
    
    public var count: Int {
        if var node = head {
            var c = 1
            while let next = node.next {
                node = next
                c += 1
            }
            return c
        } else {
            return 0
        }
    }
    
    public func nodeAt(_ index: Int) -> Node? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    public subscript(index: Int) -> T {
        let node = nodeAt(index)
        assert(node != nil)
        return node!.value
    }
    
    private func nodesBeforeAndAfter(index: Int) -> (Node?, Node?) {
        assert(index >= 0)
    /*
     head --> A --> B --> C --> D --> E --> nil
             next

     head --> A --> B --> C --> D --> E --> F --> nil
             prev  next
     */
        var i = index
        var next = head
        var prev: Node?
        
        while next != nil && i > 0 {
            i -= 1
            prev = next
            next = next!.next
        }
        assert(i == 0)
        
        return (prev, next)
    }
    
    public func insert(value: T, atIndex index: Int) {
        let (prev, next) = nodesBeforeAndAfter(index: index)
        
        let newNode = Node(value: value)
        newNode.previous = prev
        newNode.next = next
        prev?.next = newNode
        next?.previous = newNode
        
        if prev == nil {
            head = newNode
        }
    }
}


let list = LinkedList<String>()
list.append(value: "Hello")
list.isEmpty
list.first!.value
list.last!.value
list.append(value: "World")
list.first!.value
list.last!.value
list.first!.previous
list.first!.next!.value
list.last!.previous!.value
list.last!.next
list.nodeAt(0)!.value
list.nodeAt(1)!.value
list.nodeAt(2)
list[0]
list[1]
list.insert(value: "Swift", atIndex: 1)
list[0]
list[1]
list[2]
list.insert(value: "Welcome", atIndex: 0)
list[0]
list[1]
























