import UIKit

public class Node<Value>{
    public var value:Value
    public var next:Node?
    
    public init(value: Value, next: Node? = nil){
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible{
    public var description: String{
        guard let next = next else{
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next)
    }
}

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool{
        return head == nil
    }
    
    //add List's head
    public mutating func push(_ value: Value){
        head = Node(value: value, next: head)
        if tail == nil{
            tail = head
        }
    }
    
    //add List's tail
    public mutating func append(_ value: Value){
        guard !isEmpty else{
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail?.next
    }

    //attaching List's custom Index
    public func node(at index:Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index{
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    //insert List's custom index
    public mutating func insert(_ value:Value, after node: Node<Value>){
        guard tail !== node else{
            append(value)
            return
        }
        
        node.next = Node(value: value, next: node.next)
    }
    
    //remove List's head
    public mutating func pop() -> Value?{
        defer{
            head = head?.next
            
            if isEmpty{
                tail = nil
            }
        }
        return head?.value
    }
    
    //remove List's tail
    public mutating func removeLast() -> Value?{
        guard let head = head else{
            return nil
        }
        guard head.next != nil else{
            return pop()
        }
        var prev = head
        var current = head
        
        while let next = current.next{
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    //remobe List's custom Index
    public mutating func remove(after node:Node<Value>) -> Value?{
        defer{
            if node.next === tail{
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}


extension LinkedList: CustomStringConvertible{
    public var description: String{
        guard let head = head else{
            return "Empty List"
        }
        return String(describing: head)
    }
}

public func example(of description: String, action: () -> Void){
    print("---Example of \(description)---")
    action()
    print()
}

example(of: "push"){
    var list = LinkedList<Int>()
//    list.push(3)
//    list.push(2)
//    list.push(1)
    list.append(1)
    list.append(2)
    list.append(3)
    print("before insert : \(list)")
    let node = list.node(at: 0)
    let popValue = list.remove(after: node!)
    print("after insert : \(list)")
    print("poped value : " + String(describing: popValue!))
}
