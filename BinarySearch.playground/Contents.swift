//: Playground - noun: a place where people can play

import UIKit

// Recursive
func binarySearch<T: Comparable>(_ a: [T], _ key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        // Calculate where to split the array`
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        // Check left half
        if a[midIndex] > key {
            return binarySearch(a, key, range: range.lowerBound ..< midIndex)
        // Check right half
        } else if a[midIndex] < key {
            return binarySearch(a, key, range: midIndex + 1 ..< range.upperBound)
        } else {
            return midIndex
        }
    }
}

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
binarySearch(numbers, 43, range: 0 ..< numbers.count)

// Iterative
func binarySearchIterative<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if a[midIndex] == key {
            return midIndex
        } else if a[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}

binarySearchIterative(numbers, key: 19)
