//
//  IEnumerable.swift
//  DNSwift
//
//  Created by Matthew S on 6/9/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation
import Cocoa

//http://msdn.microsoft.com/en-us/library/9eekhta0%28v=vs.110%29.aspx
protocol IEnumerable: Sequence {
    typealias T;
    
    func GetEnumerator() -> IEnumerator;
    func generate() -> Enumerator<T>;
}

class Enumerable<T> : IEnumerable {
    var Objects: Array<T>;
    
    init(objs: Array<T>) {
        self.Objects = objs;
    }
    
    func GetEnumerator() -> IEnumerator {
        return Enumerator(objs: Objects);
    }
    
    func generate() -> Enumerator<T> {
        return Enumerator(objs: Objects);
    }
}