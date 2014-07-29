DNSwift
=======

.NET-compatible extensions for Swift types

DNSwift allows you to do things like:

```
var names: [String] = [ "John", "James", "Alex", "Jane", "Kate" ];
var namesStartingWithJ = names.Where({ name in name.StartsWith("J") });
```

Using it with [SharpSwift](https://github.com/matthewsot/SharpSwift) allows you to directly cross-compile and use C# in Swift projects.