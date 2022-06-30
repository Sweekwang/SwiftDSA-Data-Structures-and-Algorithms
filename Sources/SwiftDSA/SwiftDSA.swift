import Foundation

public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {

  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() { }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    // MARK: - Adding
    /// Adding a value at the front of the linked list. If the LinkedList is empty, tail will be assigned to head. Time Complexity: O(1)
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
          if tail == nil {
            tail = head
          }
    }
    
    /// Adding a value to the back of the linked list. If the LinkedList is empty, head will be assigned to tail. Time Complexity: O(!)
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail?.next
    }
    
    public mutating func insert(_ value: Value, after node: Node<Value>) {
        guard tail !== node else {
            append(value)
            return
        }
        
        node.next = Node(value: value, next: node.next)
        
        return
    }
    
    public mutating func insert(_ value: Value, at index: Int) {
        if index == 0 {
            push(value)
            return
        }
        
        let node = node(at: index - 1)!
        insert(value, after: node)
    }
    

    // MARK: - Delete
    
    // MARK: - Update
    
    // MARK: - Transversing
    public func node(at index: Int) -> Node<Value>? {
      // 1
      var currentNode = head
      var currentIndex = 0

      // 2
      while currentNode != nil && currentIndex < index {
        currentNode = currentNode!.next
        currentIndex += 1
      }

      return currentNode
    }
    
}

extension LinkedList: CustomStringConvertible {

  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}
