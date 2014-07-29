//
//  Arrays.swift
//  DNSwift
//
//  Created by Matthew S on 6/8/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

//import Foundation
import DNSwift

public extension Array {// : IEnumerable {
    public func IndexOf<T: Equatable>(item: T) -> Int {
        //looks like this is the best way to do it - http://stackoverflow.com/questions/24028860/how-to-find-index-of-list-item-in-apples-swift/24029119#24029119
        
        for (index, val) in enumerate(self) {
            if(val as T == item) {
                return index;
            }
        }
        
        return -1;
    }
    
    /*func GetEnumerator<IE:IEnumerator>() -> IE {
        return Enumerator(objs: self) as IE;
    }*/
    
    public func Any() -> Bool {
        return self.count > 0;
    }
    
    /*func Any(predicate: (T) -> Bool) {
    return self.Count(predicate) as Int > 0;
    }*/
    
    public func Count() -> Int {
        return self.count;
    }
    
    public func Count(predicate: (T) -> Bool) -> Int {
        return self.Where(predicate).Count();
    }
    
    public func Where(predicate: (T) -> Bool) -> Array<T> {
        return self.filter(predicate);
    }
    
    public func First() -> T {
        return self[0];
    }
    
    public func First(predicate: (T) -> Bool) -> T {
        return self.filter(predicate)[0];
    }
    
    public func FirstOrDefault() -> T? {
        if (self.count > 0) {
            return self[0];
        }
        else {
            return nil;
        }
    }
    
    public func FirstOrDefault(predicate: (T) -> Bool) -> T? {
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
    
    //public func ToList() -> List<T> {
        //return List(objs: self);
    //}
}