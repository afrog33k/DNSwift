//
//  ArrayExtensionTests.swift
//  DNSwift
//
//  Created by Matthew S on 7/28/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import DNSwift;
import XCTest;

class ArrayExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    var arr = [ "zero", "one", "two", "three" ];
    
    func testArrayIndexOf() {
        XCTAssertEqual(arr.IndexOf("two"), 2);
        XCTAssertEqual(arr.IndexOf("doesn't exist"), -1);
    }
    
    func testArrayAny() {
        XCTAssert(arr.Any());
        var emptyArray: [String] = [];
        XCTAssertFalse(emptyArray.Any());
    }
    
    func testArrayCount() {
        XCTAssertEqual(arr.Count(), 4);
    }
    
    func testArrayCountWithPredicate() {
        XCTAssertEqual(arr.Count({ item in item == "one" || item == "two" }), 2);
    }
    
    func testArrayWhere() {
        var containsO = arr.Where({ item in item.Contains("O") });
        XCTAssertEqual(containsO.count, 3);
    }
}