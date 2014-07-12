//
//  Enumerable.swift
//  DNSwift
//
//  Created by Matthew S on 6/9/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

class Enumerable<T> : IEnumerable, Sequence {
    //typealias T = T;
    
    var Objects: Array<T>;
    
    init() { self.Objects = Array<T>(); }

    init(objs: Array<T>) {
        self.Objects = objs;
    }

    func GetEnumerator<IE where IE:IEnumerator>() -> IE {
        return Enumerator(objs: Objects) as IE;
    }
            
    func generate() -> Enumerator<T> {
        return Enumerator(objs: Objects);
    }
}
