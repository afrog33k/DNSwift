//
//  StringExtensionTests.swift
//  DNSwift
//
//  Created by Matthew S on 7/28/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import DNSwift;
import XCTest;

class StringExtensionTests: XCTestCase {
    var numberString: String = "0123456789";
    var testString: String = "Hello, 'world'! One, two, 3, ";
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringIndex() {
        var one = numberString[1];
        XCTAssertEqual(one, "1");
    }
    
    func testStringRange() {
        var oneToThree = numberString[1...3];
        XCTAssertEqual(oneToThree, "123");
    }
    
    func testStringTostring() {
        XCTAssertEqual(testString, testString.ToString());
    }
    
    func testStringSplit() {
        var expected = [ "Hello", " 'world'! One", " two", " 3", " " ];
        var results = testString.Split(",");
        XCTAssertEqual(expected.count, results.count);
        //TODO: loop this
        XCTAssertEqual(expected[0], results[0]);
        XCTAssertEqual(expected[1], results[1]);
        XCTAssertEqual(expected[2], results[2]);
        XCTAssertEqual(expected[3], results[3]);
        XCTAssertEqual(expected[4], results[4]);
    }
    
    var testCaseString: String = "tEStIng THe CASES of stringS";
    
    func testStringToLower() {
        XCTAssertEqual(testCaseString.ToLower(), "testing the cases of strings");
    }
    
    func testStringToUpper() {
        XCTAssertEqual(testCaseString.ToUpper(), "TESTING THE CASES OF STRINGS");
    }
    
    func testStringLength() {
        XCTAssertEqual(testString.Length(), countElements(testString));
    }
    
    func testStringEmpty() {
        XCTAssertEqual(String.Empty(), "");
    }
    
    var testTrimString: String = "  some text 123    ";
    
    func testStringTrim() {
        XCTAssertEqual(testTrimString.Trim(), "some text 123");
    }
    
    func testStringTrimEnd() {
        XCTAssertEqual(testTrimString.TrimEnd(), "  some text 123");
    }
    
    func testStringTrimStart() {
        XCTAssertEqual(testTrimString.TrimStart(), "some text 123    ");
    }
    
    func testStringIndexOf() {
        XCTAssertEqual(testString.IndexOf(","), 5);
        XCTAssertEqual(testString.IndexOf("z"), -1);
    }
    
    func testStringContains() {
        XCTAssert(testString.Contains("e"));
        XCTAssertFalse(testString.Contains("z"));
    }
    
    func testStringStartsWith() {
        XCTAssert(testString.StartsWith("H"));
        XCTAssertFalse(testString.StartsWith("h"));
        XCTAssertFalse(testString.StartsWith("D"));
    }
    
    func testStringEndsWith() {
        XCTAssert(testString.EndsWith(" "));
        XCTAssertFalse(testString.EndsWith("h"));
        XCTAssertFalse(testString.EndsWith("D"));
    }
}
