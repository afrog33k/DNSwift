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

class Enumerator<T>: IEnumerator, Generator {
    var Current: T;
    
    var CurrentIndex = 0;
    var Objects: T[];
    
    init(objs: T[])
    {
        self.Current = objs[0];
        self.Objects = objs;
    };
    
    func MoveNext() -> Bool {
        self.CurrentIndex = CurrentIndex + 1;
        if(CurrentIndex >= Objects.count) {
            CurrentIndex = (Objects.count - 1);
            return false;
        }
        Current = Objects[CurrentIndex];
        return true;
    }
    
    func Reset() {
        Current = Objects[0];
        CurrentIndex = 0;
    }
    
    //Generator compliance
    func next() -> T?
    {
        if(self.MoveNext()) {
            return Current;
        }
        else {
            return nil;
        }
    }
}

