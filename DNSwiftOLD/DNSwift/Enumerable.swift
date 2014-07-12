//
//  Enumerable.swift
//  DNSwift
//
//  Created by Matthew S on 6/9/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

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
