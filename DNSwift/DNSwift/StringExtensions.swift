//
//  StringExtensions.swift
//  DNSwift
//
//  Created by Matthew S on 7/28/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

public class Testing {
    class func DoSomething() {
        
    }
}

extension String {
    //Allows for str[i] and str[i..<m]
    //Thanks! http://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
    
    subscript (r: Range<Int>) -> String {
        var start = advance(startIndex, r.startIndex)
            var end = advance(startIndex, r.endIndex)
            return substringWithRange(Range(start: start, end: end))
    }
    
    func ToString() -> String {
        return self;
    }
    
    func Split(splitAt: String) -> [String] {
        return self.componentsSeparatedByString(splitAt);
    }
    
    func ToLower() -> String {
        return self.lowercaseString;
    }
    
    func ToUpper() -> String {
        return self.uppercaseString;
    }
    
    func Trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
    }
    
    func Length() -> Int {
        return countElements(self);
    }
    
    static func Empty() -> String {
        return String();
    }
    
    //TrimEnd() and TrimStart() have pretty skech implementations - should rewrite them
    func TrimEnd() -> String {
        var numToTrim = 0;
        for(var i = (self.Length() - 1); i >= 0; i--) {
            var curr = self[i];
            
            if(curr.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).Length() == 0)
            {
                numToTrim = numToTrim + 1;
            }
            else {
                break;
            }
        }
        return self[0..<(self.Length() - numToTrim)];
    }
    
    func TrimStart() -> String {
        var numToTrim = 0;
        for(var i = 0; i < self.Length(); i++) {
            var curr = self[i];
            
            if(curr.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).Length() == 0)
            {
                numToTrim = numToTrim + 1;
            }
            else {
                break;
            }
        }
        return self[numToTrim...(self.Length() - 1)];
    }
    
    func IndexOf(substr: String) -> Int {
        let indexOfStr = self.rangeOfString(substr)?.startIndex;
        return distance(self.startIndex, indexOfStr!);
        //Thanks! Sulthan @ stackoverflow 24029163
    }
    
    func StartsWith(prefix: String) -> Bool {
        return self.hasPrefix(prefix);
    }
    
    func EndsWith(suffix: String) -> Bool {
        return self.hasSuffix(suffix);
    }
}