//: Playground - noun: a place where people can play

import UIKit

public struct Queue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        // periodically trim down the array
        let percentage = Double(head)/Double(array.count)
        if head > 2 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}

var q = Queue<String>()
q.enqueue("ada")
q.enqueue("steve")
q.enqueue("tim")
q.count

q.dequeue()
q.count
q.dequeue()
q.enqueue("tim")
q.dequeue()
print(q.array)


