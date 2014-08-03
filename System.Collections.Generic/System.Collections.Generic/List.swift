import Foundation
import DNSwift

public class List<E where E:Equatable>: IList {
    typealias T = E;
    
    private var Objects: [T];
    
    public var Count: Int {
    get {
        return Objects.count
    }
    };
    public var Capacity: Int; //todo: consider implementing this
    
    public init() {
        Capacity = Int.max;
        self.Objects = Array<T>();
    }
    
    public init(objs: [T])
    {
        Capacity = Int.max;
        self.Objects = objs;
    }
    
    //IEnumerable
    public func GetEnumerator<IE where IE:IEnumerator>() -> IE {
        return Enumerator(objs: Objects) as IE;
    }
    
    public func generate() -> Enumerator<T> {
        return Enumerator(objs: self.Objects);
    }
    
    //ICollection
    public var IsReadOnly: Bool { get { return false; } };
    
    //TODO: replace some of these AnyObjects with T
    //Methods
    public func Add(item: T) {
        Objects.append(item);
    }
    
    public func Clear() {
        Objects.removeAll(keepCapacity: false);
    }
    
    public func Contains(item: T) -> Bool {
        return contains(Objects, item);
    }
    
    public func CopyTo(inout array: [T]) {
        array.removeAll(keepCapacity: false);
        for item in Objects {
            array.append(item);
        }
    }
    
    public func CopyTo(inout array: [T], arrayIndex: Int) {
        for (index, item) in enumerate(Objects) {
            array.insert(item, atIndex: arrayIndex + index);
        }
    }
    
    public func CopyTo(index: Int, inout array: [T], arrayIndex: Int, count: Int) {
        for i in 0..<count {
            if(index + i <= Objects.count) {
                array.insert(Objects[(index + i)], atIndex: i + arrayIndex);
            }
        }
    }
    
    public func Remove(item: T) {
        Objects.removeAtIndex(Objects.IndexOf(item));
    }
    
    //IList
    public func IndexOf(obj: T) -> Int {
        return Objects.IndexOf(obj);
    }
    
    public func AddRange(objs: Array<T>) {
        for obj in objs {
            Objects.append(obj);
        }
    }
    
    //AsReadOnly
    //BinarySearch(T)
    //BinarySearch(T, IComparer<T>)
    //BinarySearch(Int, Int, T, IComparer<T>)
    
    public func ConvertAll<O>() -> List<O> {
        var newList = List<O>();
        for item in Objects {
            newList.Add(item as O);
        }
        return newList;
    }
    
    public func Equals(obj: NSObject) -> Bool {
        return obj === self;
    }
    
    public func Exists(predicate: (T) -> Bool) -> Bool {
        return self.Any(predicate);
    }
    
    //Finalize
    
    public func Find(predicate: (T) -> Bool) -> T {
        return self.First(predicate);
    }
    
    public func FindAll(predicate: (T) -> Bool) -> List<T> {
        return self.Where(predicate);
    }
    
    public func FindIndex(predicate: (T) -> Bool) -> Int {
        for (index, item) in enumerate(Objects) {
            if(predicate(item)) {
                return index;
            }
        }
        return -1;
    }
    
    //TODO: rewrite the next two so they don't enumerate the whole thing.
    //something with for i in 0..count
    public func FindIndex(startIndex: Int, predicate: (T) -> Bool) -> Int {
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
    
    public func FindIndex(startIndex: Int, count: Int, predicate: (T) -> Bool) -> Int {
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
    
    public func FindLast(predicate: (T) -> Bool) -> T {
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
    
    public func Insert(index: Int, obj item: T) {
        Objects.insert(item, atIndex: index);
    }
    
    public func InsertRange(startingIndex: Int, objs: Array<T>) {
        for (index, item) in enumerate(objs) {
            Objects.insert(item, atIndex: (startingIndex + index));
        }
    }
    
    //LastIndexOf(T)
    //LastIndexOf(T, Int)
    //LastIndexOf(T, Int, Int)
    //MemberwiseClone
    
    public func RemoveAll() {
        Objects.removeAll(keepCapacity: false);
    }
    
    public func RemoveAll(predicate: (T) -> Bool) {
        for (index, item) in enumerate(Objects) {
            if(predicate(item)) {
                Objects.removeAtIndex(index);
            }
        }
    }
    
    public func RemoveAt(index: Int) {
        Objects.removeAtIndex(index);
    }
    
    public func RemoveRange(objs: Array<T>) {
        for obj: T in objs {
            self.Remove(obj);
        }
    }
    
    public func Reverse() -> List<T> {
        return List(objs: Objects.reverse());
    }
    
    //Reverse(Int, Int)
    //Sort()
    //Sort(comparison)
    //Sort(icomparer)
    //Sort(Int,Int,IComparer)
    
    public func ToArray() -> [T] {
        return self.Objects;
    }
    
    public func ToString() -> String {
        //TODO: figure out what the native .NET libraries return for this
        return "List";
    }
    
    //TrimExcess
    
    /*public func TrueForAll(predicate: (T) -> Bool) -> Bool {
        return self.Where(predicate).Count == self.Count;
    }*/
    
    //Extension methods
    
    public func Where(predicate: (T) -> Bool) -> List<T> {
        return List(objs: self.Objects.filter(predicate));
    }
    
    public func Last() -> T { //TODO nil check/count == 0
        return self.Objects[self.Count - 1];
    }
    
    public func Any() -> Bool {
        return Count > 0;
    }
    
    public func Any(predicate: (T) -> Bool) -> Bool {
        return self.Where(predicate).Any();
    }
    
    public func First() -> T {
        return self.Objects[0];
    }
    
    public func First(predicate: (T) -> Bool) -> T {
        return self.Where(predicate).First();
    }
    
    /*public func FirstOrDefault() -> T? {
        return self.Objects.FirstOrDefault();
    }
    
    public func FirstOrDefault(predicate: (T) -> Bool) -> T? {
        return self.Objects.FirstOrDefault(predicate);
    }*/
}