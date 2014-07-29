//
//  ICollection.swift
//  DNSwift
//
//  Created by Matthew S on 7/28/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

//http://msdn.microsoft.com/en-us/library/92t2ye13%28v=vs.110%29.aspx
protocol ICollection: IEnumerable {
    typealias T;
    
    //Properties
    var Count: Int { get };
    var IsReadOnly: Bool { get };
    
    //Methods
    func Add(item: T);
    func Clear();
    func Contains(item: T) -> Bool;
    func CopyTo(inout array: [T]);
    func CopyTo(inout array: [T], arrayIndex: Int);
    func CopyTo(index: Int, inout array: [T], arrayIndex: Int, count: Int);
    func Remove(item: T);
}