//
//  Console.swift
//  DNSwift
//
//  Created by Matthew S on 6/6/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation
import Cocoa

struct Console {
    static func Write(str: String) {
        print(str);
    }
    
    static func WriteLine(line: String) {
        println(line);
    }
}