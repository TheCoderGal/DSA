//
//  Basics.swift
//  DSA
//
//  Created by Rohini Vaidya on 18/06/26.
//

import Foundation

class Node {
    
    var value: Int
    var next: Node? = nil
    var prev: Node? = nil
    
    init(value: Int) {
        self.value = value
    }
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
   
}

//Single LL
class SinglyLinkedList {
    var head: Node?
    var tail: Node?
    var length = 0
    
    func insertAtTail(value: Int) {
        let newNode = Node(value: value)
        if tail == nil {
            head = newNode
            tail = newNode
            length += 1

            return
        }
        tail?.next = newNode
        tail = newNode
        length += 1

    }
    
    func insertAtHead(value: Int) {
        if head == nil {
            head = Node(value: value)
            tail = head
            length += 1
            return
        }
        var newNode = Node(value: value)
        newNode.next = head
        head = newNode
        length += 1

    }
    
    func insertAt(index: Int, value: Int) {
        if index == 0 {
            insertAtHead(value: value)
            return
        }
        
        if index == length {
            insertAtTail(value: value)
            return
        }
        
        guard index > 0 && index < length else {
            return
        }
        
        var current = head
        
        for _ in 0..<(index - 1) {
            current = current?.next
        }
        
        let newNode = Node(value: value)
        
        newNode.next = current?.next
        current?.next = newNode
        
        length += 1
    }
    
    func getNode(at index: Int) -> Node? {
        var current = head
        for _ in 0..<index {
            current = current?.next
        }
        return current
    }
    
    func deleteFirst() {
        head = head?.next
        length -= 1
        
        if head == nil {
            tail = nil
        }
    }
    
    func deleteLast() {
        if length <= 1 {
            deleteFirst()
            return
        }
        /*
        var current = head
        while current?.next?.next != nil {
            current = current?.next
        }
        current?.next = nil
        length -= 1
         */
        
        // OR THIS
        
        let newTail = getNode(at: length - 2)
        newTail?.next = nil
        tail = newTail
        length -= 1
    }
    
    func deleteAt(index: Int) {
        if index == 0 {
            deleteFirst()
            return
        }
        if index == (length-1) {
            deleteLast()
            return
        }
        
        if index < 0 || index >= length {
            return
        }
        /*
        var current = head
        for _ in 0..<index - 1 {
            current = current?.next
        }
        
        current?.next = current?.next?.next
        length -= 1
         */
        //OR THIS
        
        let node = getNode(at: index - 1)
        node?.next = node?.next?.next
        length -= 1
    }
    
    func findNode(withValue: Int) -> Node? {
        var current = head
        while current != nil {
            if current?.value == withValue {
                return current
            }
            current = current?.next
        }
        return nil
    }
    
    func printLL() {
        var current = head
        while let node = current {
            print("\(node.value) " + "-> ", terminator: "")
            current = node.next
        }
        print("TAIL")
    }
}

