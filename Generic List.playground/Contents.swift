/*
 
 Copyright (c) 2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
*/

//: Playground - noun: a place where people can play

import UIKit

protocol ListSubscript
{
    associatedtype AnyType
    
    var elements : [AnyType] { get }
}

extension ListSubscript
{
    subscript(i: Int) -> Any
    {
        return elements[i]
    }
}

protocol ListPrintForwards
{
    associatedtype AnyType
    
    var elements : [AnyType] { get }
}

extension ListPrintForwards
{
    func showList()
    {
        if elements.count > 0
        {
            var line = ""
            var index = 1
            for element in elements
            {
                line += "\(element) "
                index += 1
            }
            print("\(line)\n")
        }
        else
        {
            print("EMPTY\n")
        }
    }
}

protocol ListPrintBackwards
{
    associatedtype AnyType
    
    var elements : [AnyType] { get }
}

extension ListPrintBackwards
{
    func showList()
    {
        if elements.count > 0
        {
            var line = ""
            var index = 1
            for element in elements.reversed()
            {
                line += "\(element) "
                index += 1
            }
            print("\(line)\n")
        }
        else
        {
            print("EMPTY\n")
        }
    }
}

protocol ListCount
{
    associatedtype AnyType
    
    var elements : [AnyType] { get }
}

extension ListCount
{
    func count() -> Int
    {
        return elements.count
    }
}

protocol List
{
    associatedtype AnyType
    
    var elements : [AnyType] { get set }
    
    mutating func remove() -> AnyType
    
    mutating func add(_ element: AnyType)
}

extension List
{
    mutating func add(_ element: AnyType)
    {
        elements.append(element)
    }
}

protocol FIFO : List, ListCount, ListPrintForwards, ListSubscript
{
}

extension FIFO
{
    mutating func remove() -> AnyType
    {
        if elements.count > 0
        {
            return elements.removeFirst()
        }
        else
        {
            return "******EMPTY******" as! AnyType
        }
    }
}

struct Queue<AnyType>: FIFO
{
    var elements: [AnyType] = []
}

var queue = Queue<Any>()
queue.add("Bob")
queue.showList()
queue.add(1)
queue.showList()
queue.add(3.0)
_ = queue[0] // subscript gives us "Bob"
_ = queue.count()
queue.showList()
queue.remove()
queue.showList()
queue.remove()
queue.showList()
queue.remove()
queue.showList()
_ = queue.count()

protocol LIFO : List, ListCount, ListPrintBackwards, ListSubscript
{
}

extension LIFO
{
    mutating func remove() -> AnyType
    {
        if elements.count > 0
        {
            return elements.removeLast()
        }
        else
        {
            return "******EMPTY******" as! AnyType
        }
    }    
}

struct Stack<AnyType>: LIFO
{
    var elements: [AnyType] = []
}

var stack = Stack<Any>()
stack.add("Bob")
stack.showList()
stack.add(1)
stack.showList()
stack.add(3.0)
_ = stack[0] // subscript gives us 3
_ = stack.count()
stack.showList()
stack.remove()
stack.showList()
stack.remove()
stack.showList()
stack.remove()
stack.showList()
_ = stack.count()
