//
//  Enumerator.swift
//  DNSwift
//
//  Created by Matthew S on 7/28/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

class Enumerator<T> : IEnumerator {
    public var Current: T {
        get {
            return Objects[CurrentIndex];
        }
    }
    
    public var CurrentIndex = 0;
    public var Objects: [T];
    
    init(objs: [T]) {
        self.Objects = objs;
    }
    
    public func MoveNext() -> Bool {
        self.CurrentIndex = CurrentIndex + 1;
        if(CurrentIndex >= Objects.count) {
            CurrentIndex = (Objects.count - 1);
            return false;
        }
        return true;
    }
    
    public func Reset() {
        CurrentIndex = 0;
    }
    
    //Generator compliance
    public func next() -> T?
    {
        if(self.MoveNext()) {
            return self.Objects[self.CurrentIndex];
            //return Current;
        }
        else {
            return nil;
        }
    }
    
    public func Dispose() {
        
    }
}