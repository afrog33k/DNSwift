//
//  Enumerator.swift
//  DNSwift
//
//  Created by Matthew S on 7/28/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

class Enumerator<T> : IEnumerator {
    var Current: T {
        get {
            return Objects[CurrentIndex];
        }
    }
    
    var CurrentIndex = 0;
    var Objects: [T];
    
    init(objs: [T]) {
        self.Objects = objs;
    }
    
    func MoveNext() -> Bool {
        self.CurrentIndex = CurrentIndex + 1;
        if(CurrentIndex >= Objects.count) {
            CurrentIndex = (Objects.count - 1);
            return false;
        }
        return true;
    }
    func Reset() {
        CurrentIndex = 0;
    }
    
    //Generator compliance
    func next() -> T?
    {
        if(self.MoveNext()) {
            return self.Objects[self.CurrentIndex];
            //return Current;
        }
        else {
            return nil;
        }
    }
    
    func Dispose() {
        
    }
}