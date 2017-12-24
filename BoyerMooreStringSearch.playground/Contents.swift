//: Playground - noun: a place where people can play

import UIKit

extension String {
    func index(of pattern: String) -> Index? {
        // 1
//        for i in indices {
//
//            // 2
//            var j = i
//            var found = true
//            for p in pattern.indices {
//                guard j != endIndex && self[j] == pattern[p] else { found = false; break }
//                j = index(after: j)
//            }
//            if found {
//                return i
//            }
//        }
        
        return nil
    }
    
    fileprivate var skipTable: [Character: Int] {
        var skipTable: [Character: Int] = [:]
        for (i, c) in enumerated() {
            skipTable[c] = count - i - 1
        }
        return skipTable
    }
    fileprivate func match(from currentIndex: Index, with pattern: String) -> Index? {
        return match(from: index(before: currentIndex), with: "\(pattern.dropLaster())")
    }
}

let helloText = "Hello"
helloText.skipTable.forEach { print($0) }
//text.index(of: "lo")

