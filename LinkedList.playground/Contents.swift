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


