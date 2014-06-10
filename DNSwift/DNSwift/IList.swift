//
//  IList.swift
//  DNSwift
//
//  Created by Matthew S on 6/9/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

protocol IList: Sequence {
    typealias T;
    func IndexOf(obj: AnyObject) -> Int;
    func Add(obj: T);
    func AddRange(objs: T[]);
    func RemoveAt(index: Int);
    func Remove(obj: AnyObject);
    func RemoveRange(objs: AnyObject[]);
    func RemoveAll();
    func RemoveAll(predicate: (T) -> Bool);
    func Insert(index: Int, obj: T);
    func InsertRange(startingIndex: Int, objs: T[]);
    
    func generate() -> Enumerator<T>;
}