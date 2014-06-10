//
//  Arrays.swift
//  DNSwift
//
//  Created by Matthew S on 6/8/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation
import Cocoa

//TODO: rewrite this stuff w/ IEnumerable/etc.
extension Array {    
    func Count() -> Int {
        return self.count;
    }    
    func Where(predicate: (T) -> Bool) -> Array<T> {
        return self.filter(predicate);
    }
    
    func First(predicate: (T) -> Bool) -> T {
        return self.filter(predicate)[0];
    }
    
    func FirstOrDefault(predicate: (T) -> Bool) -> T? {
        var found = self.filter(predicate);
        if(found.count > 0)
        {
            return found[0];
        }
        else
        {
            return nil;
        }
    }
    
    func ToList() -> List<T> {
        return List(objs: self);
    }
}