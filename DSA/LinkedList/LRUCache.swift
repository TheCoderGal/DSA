//
//  LL.swift
//  DSA
//
//  Created by Rohini Vaidya on 18/06/26.
//

import Foundation


class LRUCache {
    
    var capacity: Int = 0
    var cache: [Int: Node] = [:]
    
    //dummy nodes
    var head: Node = .init(value: -1)
    var tail: Node = .init(value: -1)
    
    init(capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    //Remove
    func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    func addToTail(_ node: Node) {
        tail.prev?.next = node
        node.prev = tail.prev
        node.next = tail
        tail.prev = node
    }
    
    func get(_ key: Int) -> Int? {
        guard let node = cache[key] else {
            return nil
        }
        remove(node)
        addToTail(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            remove(node)
            node.value = value
            addToTail(node)
        } else {
            if cache.count == capacity {
                let lru = head.next
                remove(lru!)
                cache.removeValue(forKey: lru!.value)
            }
            let node = Node(value: value)
            cache[key] = node
            addToTail(node)
        }
    }
}
