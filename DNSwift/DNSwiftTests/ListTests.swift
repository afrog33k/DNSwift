//
//  DNSwiftTests.swift
//  DNSwiftTests
//
//  Created by Matthew S on 6/6/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import XCTest
import DNSwift

class ListTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreation() {
        var newList = List<String>();
        var inittedList = List(objs: ["Hello", "Hi", "Wasup"]);
        XCTAssert(newList != nil);
        XCTAssert(inittedList.Objects.count == 3);
    }
}