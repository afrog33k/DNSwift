//
//  IList.swift
//  DNSwift
//
//  Created by Matthew S on 6/9/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

protocol IList: IEnumerable, ICollection {
    typealias T;
    var Count: Int { get };
    
    func IndexOf(obj: T) -> Int;
    func Add(obj: T);
    func AddRange(objs: [T]);
    func RemoveAt(index: Int);
    func Remove(obj: T);
    func RemoveRange(objs: [T]);
    func RemoveAll();
    func RemoveAll(predicate: (T) -> Bool);
    func Insert(index: Int, obj: T);
    func InsertRange(startingIndex: Int, objs: [T]);
    
    func generate() -> Enumerator<T>;
}