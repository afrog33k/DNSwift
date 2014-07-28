//
//  StringExtensionTests.swift
//  DNSwift
//
//  Created by Matthew S on 7/28/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import DNSwift;
import XCTest;

class DNSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringIndex() {
        var str = "01234";
        var one = str[1];
        XCTAssertEqual(one, "1");
    }
    
    func testStringRange() {
        var str = "01234";
        var oneToThree = str[1...3];
        XCTAssertEqual(oneToThree, "123");
    }
    
    func testStringTrimStart() {
        var str = "   hello  ";
        var trimmed = str.TrimStart();
        XCTAssertEqual(trimmed, "hello  ");
    }
}
