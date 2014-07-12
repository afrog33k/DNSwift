import Foundation

class Enumerator<T>: IEnumerator {    
    //This throws a compiler error - unimplemented IRGen feature! non-fixed class layout
    //Some other people have gotten the error, looks like it's a problem on Apple's end, not ours
    var Current: T {
        get {
            return Objects[CurrentIndex];
        }
    }
    
    var CurrentIndex = 0;
    var Objects: [T];
    
    init(objs: [T])
    {
        self.Objects = objs;
    };
    
    func MoveNext() -> Bool {
        self.CurrentIndex = CurrentIndex + 1;
        if(CurrentIndex >= Objects.count) {
            CurrentIndex = (Objects.count - 1);
            return false;
        }
        return true;
    }
    
    func Reset() {
        CurrentIndex = 0;
    }
        
    //Generator compliance
    func next() -> T?
    {
        if(self.MoveNext()) {
            return self.Objects[self.CurrentIndex];
            //return Current;
        }
        else {
            return nil;
        }
    }
    
    func Dispose() {
    }
}