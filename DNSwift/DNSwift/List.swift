//
//  List.swift
//  DNSwift
//
//  Created by Matthew S on 6/9/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

//http://msdn.microsoft.com/en-us/library/6sh2ey19%28v=vs.110%29.aspx
class List<T>: IList {
    var Objects: T[];
    
    var Count: Int {
        get {
            return Objects.count;
        }
    };
    
    var IsReadOnly: Bool { get { return false; } };
    
    //init(collection) not supported ;)
    
    init() {
        self.Objects = Array<T>();
    }

    init(objs: T[])
    {
        self.Objects = objs;
    }
    
    //IEnumerable
    func GetEnumerator() -> IEnumerator {
        return Enumerator(objs: Objects);
    }
    
    func generate() -> Enumerator<T> {
        return Enumerator(objs: self.Objects);
    }
    
    
    //LINQy stuff
    func Add(item: T) {
        Objects.append(item);
    }
    
    func AddRange(objs: Array<T>) {
        for obj in objs {
            Objects.append(obj);
        }
    }
    
    //AsReadOnly
    //BinarySearch(T)
    //BinarySearch(T, IComparer<T>)
    //BinarySearch(Int, Int, T, IComparer<T>)
    
    func Clear() {
        Objects.removeAll(keepCapacity: false);
    }
    
    func Contains(item: T) -> Bool {
        return contains(Objects, item);
    }
    
    func ConvertAll<O>() -> List<O> {
        var newList = List<O>();
        for item in Objects {
            newList.Add(item as O);
        }
        return newList;
    }
    
    func CopyTo(inout array: T[]) {
        array.removeAll(keepCapacity: false);
        for item in Objects {
            array.append(item);
        }
    }
    
    func CopyTo(inout array: T[], arrayIndex: Int) {
        for (index, item) in enumerate(Objects) {
            array.insert(item, atIndex: arrayIndex + index);
        }
    }
    
    func CopyTo(index: Int, inout array: T[], arrayIndex: Int, count: Int) {
        for i in 0..count {
            if(index + i <= Objects.count) {
                array.insert(Objects[(index + i)], atIndex: i + arrayIndex);
            }
        }
    }
    
    func Equals(obj: NSObject) -> Bool {
        return obj === self;
    }
    
    func Exists(predicate: (T) -> Bool) -> Bool {
        return self.Any(predicate);
    }
    
    //Finalize
    
    func Find(predicate: (T) -> Bool) -> T {
        return self.First(predicate);
    }
    
    func FindAll(predicate: (T) -> Bool) -> List<T> {
        return self.Where(predicate);
    }
    
    func FindIndex(predicate: (T) -> Bool) -> Int {
        for (index, item) in enumerate(Objects) {
            if(predicate(item)) {
                return index;
            }
        }
        return -1;
    }
    
    //TODO: rewrite the next two so they don't enumerate the whole thing.
    //something with for i in 0..count
    func FindIndex(startIndex: Int, predicate: (T) -> Bool) -> Int {
        for (index, item) in enumerate(Objects) {
            if(index < startIndex)
            {
                continue;
            }
            
            if(predicate(item)) {
                return index;
            }
        }
        return -1;
    }
    
    func FindIndex(startIndex: Int, count: Int, predicate: (T) -> Bool) -> Int {
        for(index, item) in enumerate(Objects) {
            if(index < startIndex) {
                continue;
            }
            if(index > (startIndex + count)) {
                break;
            }
            
            if(predicate(item)) {
                return index;
            }
        }
        return -1;
    }
    
    func FindLast(predicate: (T) -> Bool) -> T {
        return self.Where(predicate).Last();
    }
    
    //FindLastIndex(predicate)
    //FindLastIndex(Int, predicate)
    //FindLastIndex(Int, Int, predicate)
    //ForEach
    //GetHashCode
    //GetRange
    //GetType
    
    //Thanks! http://practicalswift.com/2014/06/14/the-swift-standard-library-list-of-built-in-functions/
    func IndexOf(obj: T) -> Int {
        var index = find(Objects, obj);
        return (index == nil) ? -1 : index;
    }
    
    //IndexOf(T, Int)
    //IndexOf(T, Int, Int)
    
    func Insert(index: Int, obj item: T) {
        Objects.insert(item, atIndex: index);
    }
    
    func InsertRange(startingIndex: Int, objs: Array<T>) {
        for (index, item) in enumerate(objs) {
            Objects.insert(item, atIndex: (startingIndex + index));
        }
    }
    
    //LastIndexOf(T)
    //LastIndexOf(T, Int)
    //LastIndexOf(T, Int, Int)
    //MemberwiseClone
    
    func Remove(obj: T) {
        Objects.removeAtIndex(self.IndexOf(obj));
    }
    
    func RemoveAll() {
        Objects.removeAll(keepCapacity: false);
    }
    
    func RemoveAll(predicate: (T) -> Bool) {
        for (index, item) in enumerate(Objects) {
            if(predicate(item)) {
                Objects.removeAtIndex(index);
            }
        }
    }
    
    func RemoveAt(index: Int) {
        Objects.removeAtIndex(index);
    }
    
    func RemoveRange(objs: Array<T>) {
        for obj: T in objs {
            self.Remove(obj);
        }
    }
    
    func Reverse() -> List<T> {
        return List(objs: Objects.reverse());
    }
    
    //Reverse(Int, Int)
    //Sort()
    //Sort(comparison)
    //Sort(icomparer)
    //Sort(Int,Int,IComparer)
    
    func ToArray() -> T[] {
        return self.Objects;
    }
    
    func ToString() -> String {
        //TODO: figure out what the native .NET libraries return for this
        return "List";
    }
    
    //TrimExcess
    
    func TrueForAll(predicate: (T) -> Bool) -> Bool {
        return self.Where(predicate).Count == self.Count;
    }
    
    //Extension methods
    
    func Where(predicate: (T) -> Bool) -> List<T> {
        return List(objs: self.Objects.Where(predicate));
    }
    
    func Last() -> T { //TODO nil check/count == 0
        return self.Objects[self.Count - 1];
    }
    
    func Any() -> Bool {
        return Count > 0;
    }
    
    func Any(predicate: (T) -> Bool) -> Bool {
        return self.Where(predicate).Any();
    }
    
    func First() -> T {
        return self.Objects.First();
    }
    
    func First(predicate: (T) -> Bool) -> T {
        return self.Objects.First(predicate);
    }
    
    func FirstOrDefault() -> T? {
        return self.Objects.FirstOrDefault();
    }
    
    func FirstOrDefault(predicate: (T) -> Bool) -> T? {
        return self.Objects.FirstOrDefault(predicate);
    }
}