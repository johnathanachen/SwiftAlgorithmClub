//: Playground - noun: a place where people can play

import UIKit
import Foundation
import CommonCrypto


indirect enum MerkleTree {
    case Empty
    case Node(hash: String, data: NSData?, left: MerkleTree, right: MerkleTree)
    
    init() { self = .Empty }
    
    init(hash: String) {
        self = MerkleTree.Node(hash: hash, data: nil, left: .Empty, right: .Empty)
    }
    
    init(blob: NSData) {
        // make a string from the data and make a hash from it.
        let hash = String(data: blob, encoding: NSUTF8StringEncoding)?.SHAString()
        self = MerkleTree.Node(hash: hash!, data: blob, left: .Empty, right: .Empty)
    }
}


extension String {
    
    func SHAString() -> String {
        if let data = dataUsingEncoding(NSUTF8StringEncoding) {
            
            let result = NSMutableData(length: Int(CC_SHA256_DIGEST_LENGTH))!
            let resultBytes = UnsafeMutablePointer<CUnsignedChar>(result.mutableBytes)
            
            CC_SHA256(data.bytes, CC_LONG(data.length), resultBytes)
            
            let resultEnumerator    = UnsafeBufferPointer<CUnsignedChar>(start: resultBytes, count: result.length)
            let SHA256                = NSMutableString()
            
            for c in resultEnumerator {
                SHA256.appendFormat("%02x", c)
            }
            
            return SHA256 as String
        }
        return ""
    }
}
