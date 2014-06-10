//
//  Enumerator.swift
//  DNSwift
//
//  Created by Matthew S on 6/9/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

class Enumerator<T>: IEnumerator {
    //This throws a compiler error - unimplemented IRGen feature! non-fixed class layout
    //Some other people have gotten the error, looks like it's a problem on Apple's end, not ours
    //var Current: T;
    
    var CurrentIndex = 0;
    var Objects: T[];
    
    init(objs: T[])
    {
        //self.Current = objs[0];
        self.Objects = objs;
    };
    
    func MoveNext() -> Bool {
        self.CurrentIndex = CurrentIndex + 1;
        if(CurrentIndex >= Objects.count) {
            CurrentIndex = (Objects.count - 1);
            return false;
        }
        //Current = Objects[CurrentIndex];
        return true;
    }
    
    func Reset() {
        //Current = Objects[0];
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
}