//
//  IEnumerator.swift
//  DNSwift
//
//  Created by Matthew S on 6/9/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

//http://msdn.microsoft.com/en-us/library/78dfe2yb%28v=vs.110%29.aspx
protocol IEnumerator: Generator {
    typealias T;
    var Current: T { get }
    func MoveNext() -> Bool;
    func Reset();
    func next() -> T?;
}