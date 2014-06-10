//
//  IList.swift
//  DNSwift
//
//  Created by Matthew S on 6/9/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

class List<T>: IEnumerable {
    var Objects: T[];
    
    init(objs: T[])
    {
        self.Objects = objs;
    }
    
    //IEnumerable
    func GetEnumerator() -> IEnumerator {
        return Enumerator(objs: Objects);
    }
    
    func generate() -> Enumerator<T> {
        return Enumerator(objs: self.Objects);
    }
    
    //Thanks! http://ericasadun.com/2014/06/05/swift-objc-like-array-index/
    func IndexOf(obj: AnyObject) -> Int {
        let index = (Objects as NSArray).indexOfObject(obj);
        return (index == NSNotFound) ? -1 : index;
    }
    
    func Add(obj: T) {
        Objects.append(obj);
    }
    
    func AddRange(objs: Array<T>) {
        for obj in objs {
            Objects.append(obj);
        }
    }
    
    func RemoveAt(index: Int) {
        Objects.removeAtIndex(index);
    }
    
    func Remove(obj: AnyObject) {
        Objects.removeAtIndex(self.IndexOf(obj));
    }
    
    func RemoveRange(objs: Array<AnyObject>) {
        for obj: AnyObject in objs {
            self.Remove(obj);
        }
    }
    
    func RemoveAll() {
        Objects.removeAll(keepCapacity: false);
    }
    
    func RemoveAll(predicate: (T) -> Bool) {
        for (index, item) in enumerate(self) {
            if(predicate(item)) {
                Objects.removeAtIndex(index);
            }
        }
    }
    
    func Insert(index: Int, obj: T) {
        Objects.insert(obj, atIndex: index);
    }
    
    func InsertRange(startingIndex: Int, objs: Array<T>) {
        for (index, item) in enumerate(objs) {
            Objects.insert(item, atIndex: (startingIndex + index));
        }
    }
}