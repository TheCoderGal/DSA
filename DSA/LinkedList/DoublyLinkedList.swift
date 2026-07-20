//
//  DoublyLinkedList.swift
//  DSA
//
//  Created by Rohini Vaidya on 18/06/26.
//

class DoublyLinkedList {
    
    var head: Node?
    var tail: Node?
    var length = 0
    
    func insertAtHead(_ value: Int) {
        let node = Node(value: value)
        
        if head == nil {
            head = node
            tail = node
        } else {
            node.next = head
            head?.prev = node
            node.prev = nil
            head = node
        }
        length += 1
    }
    
    func insertAtTail(_ value: Int) {
        let node = Node(value: value)
        
        if tail == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            node.prev = tail
            node.next = nil
            tail = node
        }
        
        length += 1
    }
    
    func printLL() {
        var current = head
        while let node = current {
            print("\(node.value) " + "-> ", terminator: "")
            current = node.next
        }
        print("TAIL")
    }
    
    func printReverse() {
        var current = tail
        while let node = current {
            print("\(node.value) " + "-> ", terminator: "")
            current = node.prev
        }
        print("HEAD")
    }
}
