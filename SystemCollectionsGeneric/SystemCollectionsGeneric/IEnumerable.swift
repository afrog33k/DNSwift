import Foundation

//http://msdn.microsoft.com/en-us/library/9eekhta0%28v=vs.110%29.aspx
public protocol IEnumerable: SequenceType {
    //typealias T;
    
    func GetEnumerator<IE where IE:IEnumerator>() -> IE;
}