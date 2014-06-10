
//
//  ICollection.swift
//  DNSwift
//
//  Created by Matthew S on 6/9/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

//http://msdn.microsoft.com/en-us/library/92t2ye13%28v=vs.110%29.aspx
protocol ICollection: IEnumerable {
    typealias T;
    
    //Properties
    var Count: Int { get };
    var IsReadOnly: Bool { get };
    
    //TODO: replace some of these AnyObjects with T
    //Methods
    func Add(item: T);
    func Clear();
    func Contains(item: AnyObject) -> Bool;
    func CopyTo(inout array: T[], arrayIndex: Int);
    func Remove(item: AnyObject);
}