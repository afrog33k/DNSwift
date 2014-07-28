//
//  Arrays.swift
//  DNSwift
//
//  Created by Matthew S on 6/8/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

extension Array {// : IEnumerable {
    func IndexOf<T: Equatable>(item: T) -> Int {
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
    
    func Any() -> Bool {
        return self.count > 0;
    }
    
    /*func Any(predicate: (T) -> Bool) {
    return self.Count(predicate) as Int > 0;
    }*/
    
    func Count() -> Int {
        return self.count;
    }
    
    func Count(predicate: (T) -> Bool) -> Int {
        return self.Where(predicate).Count();
    }
    
    func Where(predicate: (T) -> Bool) -> Array<T> {
        return self.filter(predicate);
    }
    
    func First(predicate: (T) -> Bool) -> T {
        return self.filter(predicate)[0];
    }
    
    func First() -> T {
        return self[0];
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
    
    func FirstOrDefault() -> T? {
        if (self.count > 0) {
            return self[0];
        }
        else {
            return nil;
        }
    }
    
    /*func ToList() -> List<T> {
        return List(objs: self);
    }*/
}