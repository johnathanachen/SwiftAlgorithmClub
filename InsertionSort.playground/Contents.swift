//: Playground - noun: a place where people can play

import UIKit

func insertionSort(_ array: [Int]) -> [Int] {
    var a = array
    for x in 1..<a.count {
        var y = x
        while y > 0 && a[y] < a[y - 1] {
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    return a
}

func genericInsertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0 && isOrderedBefore(temp, a[y - 1]) {
            a.swapAt(y - 1, y)
            y -= 1
        }
        a[y] = temp
    }
    return a
}

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
insertionSort(list)

let numbers = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
genericInsertionSort(numbers, <)
genericInsertionSort(numbers, >)










