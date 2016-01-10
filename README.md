# Cutis

[![CocoaPods](https://img.shields.io/cocoapods/v/Cutis.svg?style=flat)]() 
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Cutis ("Comfortable UTIs") is a thin Swift wrapper on top of the UTI (Universal Type Identifier) C API.

Apart from providing a typesafe and object-oriented wrapper around type identifiers, Cutis does the heavy lifting for you by taking care of the casting and memory management required when interacting with CoreFoundation-style APIs.

If you deal a lot with type identifiers in your project, Cutis can make your code simpler and easier to follow.

### Examples

Getting the default file extension for a type:

```swift
let uti = UTType("com.adobe.pdf")

if let tags = uti.declaration?.tagSpecification,
   let allExts = tags[UTTypeTagClass.FileExtension],
   let ext = allExts.first {
    NSLog("preferred file extension for the given type: %@", ext)
}
```

Checking whether there is an image representation of a given pasteboard item:

```swift
func hasImageRep(item: NSPasteboardItem) -> Bool {
   return item.types.contains({ UTType($0).conformsTo(.Image) })
}
```

### Requirements

Xcode 7, Swift 2.1, OSX 10.9, iOS 8.0
