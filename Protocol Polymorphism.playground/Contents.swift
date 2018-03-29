/*
 
 Copyright (c) 2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
*/

//: Playground - noun: a place where people can play

import UIKit

protocol Top
{
    var protocolName: String { get }
}

protocol Middle: Top
{
    
}

protocol Bottom: Middle
{
    
}

struct TopStruct : Top
{
    var protocolName: String = "TopStruct"
}

struct MiddleStruct : Middle
{
    var protocolName: String = "MiddleStruct"
}

struct BottomStruct : Bottom
{
    var protocolName: String = "BottomStruct"
}

let top = TopStruct()
let middle = MiddleStruct()
let bottom = BottomStruct()

var topStruct: Top
topStruct = bottom
print("\(topStruct)\n")
// prints "BottomStruct(protocolName: "BottomStruct")"

topStruct = middle
print("\(topStruct)\n")
// prints "MiddleStruct(protocolName: "MiddleStruct")"

topStruct = top
print("\(topStruct)\n")
// prints "TopStruct(protocolName: "TopStruct")"

let protocolStructs:[Top] = [top,middle,bottom]

for protocolStruct in protocolStructs
{
    print("\(protocolStruct)\n")
}

// prints to console:
//
// TopStruct(protocolName: "TopStruct")
//
// MiddleStruct(protocolName: "MiddleStruct")
//
// BottomStruct(protocolName: "BottomStruct")

