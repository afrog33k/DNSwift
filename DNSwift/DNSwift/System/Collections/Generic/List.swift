//
//  List.swift
//  DNSwift
//
//  Created by Matthew S on 7/28/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation

class List<E where E:Equatable>: IList {
    typealias T = E;
    
    var Objects: [T];
    var Count: Int {
        get {
            return Objects.count
        }
    };
    var Capacity: Int; //todo: consider implementing this
    
    init() {
        Capacity = Int.max;
        self.Objects = Array<T>();
    }
    
    init(objs: [T])
    {
        Capacity = Int.max;
        self.Objects = objs;
    }

    //IEnumerable
    func GetEnumerator<IE where IE:IEnumerator>() -> IE {
        return Enumerator(objs: Objects) as IE;
    }
    
    func generate() -> Enumerator<T> {
        return Enumerator(objs: self.Objects);
    }
    
    //ICollection
    var IsReadOnly: Bool { get { return false; } };
    
    //TODO: replace some of these AnyObjects with T
    //Methods
    func Add(item: T) {
        Objects.append(item);
    }
    
    func Clear() {
        Objects.removeAll(keepCapacity: false);
    }
    
    func Contains(item: T) -> Bool {
        return contains(Objects, item);
    }
    
    func CopyTo(inout array: [T]) {
        array.removeAll(keepCapacity: false);
        for item in Objects {
            array.append(item);
        }
    }
    
    func CopyTo(inout array: [T], arrayIndex: Int) {
        for (index, item) in enumerate(Objects) {
            array.insert(item, atIndex: arrayIndex + index);
        }
    }
    
    func CopyTo(index: Int, inout array: [T], arrayIndex: Int, count: Int) {
        for i in 0..<count {
            if(index + i <= Objects.count) {
                array.insert(Objects[(index + i)], atIndex: i + arrayIndex);
            }
        }
    }
    
    func Remove(item: T) {
        Objects.removeAtIndex(Objects.IndexOf(item));
    }
    
    //IList
    func IndexOf(obj: T) -> Int {
        return Objects.IndexOf(obj);
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
    
    func ConvertAll<O>() -> List<O> {
        var newList = List<O>();
        for item in Objects {
            newList.Add(item as O);
        }
        return newList;
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
    
    func ToArray() -> [T] {
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