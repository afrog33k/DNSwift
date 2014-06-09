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
    
    //Thanks! http://ericasadun.com/2014/06/05/swift-objc-like-array-index/
    func IndexOf(obj: AnyObject) -> Int {
        let index = (self as NSArray).indexOfObject(obj);
        return (index == NSNotFound) ? -1 : index;
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
    
    mutating func Add(obj: T) {
        self.append(obj);
    }
    
    mutating func AddRange(objs: Array<T>) {
        for obj in objs {
            self.append(obj);
        }
    }
    
    mutating func RemoveAt(index: Int) {
        self.removeAtIndex(index);
    }
    
    mutating func Remove(obj: AnyObject) {
        self.removeAtIndex(self.IndexOf(obj));
    }
    
    mutating func RemoveRange(objs: Array<AnyObject>) {
        for obj: AnyObject in objs {
            self.Remove(obj);
        }
    }
    
    mutating func RemoveAll() {
        self.removeAll(keepCapacity: false);
    }
    
    mutating func RemoveAll(predicate: (T) -> Bool) {
        for (index, item) in enumerate(self) {
            if(predicate(item)) {
                self.removeAtIndex(index);
            }
        }
    }
    
    mutating func Insert(index: Int, obj: T) {
        self.insert(obj, atIndex: index);
    }
    
    mutating func InsertRange(startingIndex: Int, objs: Array<T>) {
        for (index, item) in enumerate(objs) {
            self.insert(item, atIndex: (startingIndex + index));
        }
    }
}