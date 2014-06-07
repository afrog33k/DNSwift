//
//  DNSwiftTests.swift
//  DNSwiftTests
//
//  Created by Matthew S on 6/6/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import XCTest
import DNSwift

class StringTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringSplit() {
        var str = "Hello, there! This is something, something that I like.";
        var parts = str.Split(", ");
        var expected: String[] = [ "Hello", "there! This is something", "something that I like."];
        XCTAssert(parts == expected);
    }
    
    func testStringToString() {
        var str = "Hello!";
        var newStr = str.ToString();
        XCTAssert(str == newStr);
        XCTAssert(str !== newStr);
    }
    
    func testStringCases() {
        var str = "Some Cases";
        var lower = str.ToLower();
        var upper = str.ToUpper();
        XCTAssert(lower == "some cases");
        XCTAssert(upper == "SOME CASES");
        XCTAssert(str == "Some Cases"); //make sure neither modifiese the string itself
    }
    
    func testStringLength() {
        var str = "12345 7 9";
        XCTAssert(str.Length() == 9);
    }
    
    func testStringEmpty() {
        var empty = String.Empty();
        XCTAssert(empty == String());
        XCTAssert(empty == "");
    }
    
    func testStringTrim() {
        var str = "   some string  \r\n  ";
        var trimmed = str.Trim();
        XCTAssert(trimmed == "some string");
    }
    
    func testStringTrimEnd() {
        var str = "  some string  \r\n";
        var trimmed = str.TrimEnd();
        XCTAssert(trimmed == "  some string");
    }
    
    func testStringTrimStart() {
        var str = "\r\n  some string  ";
        var trimmed = str.TrimStart();
        XCTAssert(trimmed == "some string  ");
    }
    
    func testStringIndexOf() {
        var str = "0123456";
        XCTAssert(str.IndexOf("3") == 3);
    }
    
    func testStringStartsEndsWith() {
        var str = "prefix some string suffix";
        XCTAssert(str.StartsWith("prefix"));
        XCTAssert(str.EndsWith("suffix"));
        
        XCTAssert(!str.StartsWith("suffix"));
        XCTAssert(!str.EndsWith("prefix"));
    }
}