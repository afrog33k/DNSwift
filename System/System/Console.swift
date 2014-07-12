import Foundation

class Console {
    class func Write(str: String) {
        print(str);
    }
    
    class func WriteLine(line: String) {
        println(line);
    }
    
    class func Read() -> String {
        //TODO
        return "NOT CORRECT";
    }
    
    class func ReadLine() -> String {
        //http://stackoverflow.com/questions/24004776/input-from-the-keyboard-in-command-line-application
        var keyboard = NSFileHandle.fileHandleWithStandardInput()
        var inputData = keyboard.availableData
        return NSString(data: inputData, encoding:NSUTF8StringEncoding).stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet());
    }
}