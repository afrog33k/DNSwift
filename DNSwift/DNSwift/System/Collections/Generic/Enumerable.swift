//
//  Enumerable.swift
//  DNSwift
//
//  Created by Matthew S on 7/28/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

public class Enumerable<T> : IEnumerable {
    private var Objects: Array<T>;
    
    public init() { self.Objects = Array<T>(); }
    
    public init(objs: Array<T>) {
        self.Objects = objs;
    }
    
    public func GetEnumerator<IE where IE:IEnumerator>() -> IE {
        return Enumerator(objs: Objects) as IE;
    }
    
    public func generate() -> Enumerator<T> {
        return Enumerator(objs: Objects);
    }
}