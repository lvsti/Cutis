//
//  UTType.swift
//  Cutis
//
//  Created by Tamas Lustyik on 2016. 01. 07..
//  Copyright © 2016. Tamas Lustyik. All rights reserved.
//

import Foundation
#if os(iOS)
import MobileCoreServices
#endif

public struct UTType {
    public let stringValue: String
    
    public init(_ s: String) {
        stringValue = s
    }
    
    /// Returns whether or not the specified UTI has a declaration
    /// registered on the current system. Dynamic UTIs are never
    /// registered.
    @available(OSX 10.10, iOS 8.0, *)
    public var isDeclared: Bool {
        return UTTypeIsDeclared(stringValue)
    }
    
    /// Returns whether or not the specified UTI is a dynamic UTI.
    @available(OSX 10.10, iOS 8.0, *)
    public var isDynamic: Bool {
        return UTTypeIsDynamic(stringValue)
    }
    
    /// Returns the identified type's declaration, as it
    /// appears in the declaring bundle's info property list. This is the
    /// access path to other type properties for which direct access is
    /// rarely needed.
    ///
    /// - returns: a tag declaration dictionary, or nil if the type is not declared
    public var declaration: UTTypeDeclaration? {
        guard
            let unmanaged = UTTypeCopyDeclaration(stringValue),
            let dict = (unmanaged.takeRetainedValue() as NSDictionary) as? [String: AnyObject]
        else {
            return nil
        }
        
        return UTTypeDeclaration(dictionaryValue: dict)
    }
    
    /// Returns the URL of the bundle containing the type declaration of
    /// the identified type.
    /// 
    /// - returns: a URL, or nil if the bundle cannot be located.
    public var declaringBundleURL: NSURL? {
        guard let unmanaged = UTTypeCopyDeclaringBundleURL(stringValue) else {
            return nil
        }
        
        return unmanaged.takeRetainedValue()
    }
    
    /// Returns the localized, user-readable type description string
    ///
    /// - returns: a localized string, or nil if no type description is available
    public var typeDescription: String? {
        guard let unmanaged = UTTypeCopyDescription(stringValue) else {
            return nil
        }
        
        return unmanaged.takeRetainedValue() as String
    }
    
    /// Tests for a conformance relationship between the two identified
    /// types. 
    ///
    /// - parameter type: the uniform type identifier against which to test conformance
    ///
    /// - returns: true if the types are equal, or if the receiver
    /// conforms, directly or indirectly, to `type`.
    public func conformsTo(type: UTType) -> Bool {
        return UTTypeConformsTo(stringValue, type.stringValue)
    }
    
    /// Returns the identified type's preferred tag with the specified
    /// tag class. This is the primary function to use for
    /// going from uniform type identifier to tag. If the type
    /// declaration included more than one tag with the specified class,
    /// the first tag in the declared tag array is the preferred tag.
    ///
    /// - parameter tagClass: the class of tags to return
    ///
    /// - returns: the tag string, or nil if there is no tag of the specified class.
    public func preferredTagWithClass(tagClass: UTTypeTagClass) -> String? {
        guard let unmanaged = UTTypeCopyPreferredTagWithClass(stringValue, tagClass.name) else {
            return nil
        }
        
        return unmanaged.takeRetainedValue() as String
    }
    
    /// Returns each of the identified type's tags with the specified
    /// tag class as an array of strings.
    ///
    /// - parameter tagClass: the class of tags to return
    ///
    /// - returns: an array of tag strings, or nil if there is no tag of the specified class.
    @available(OSX 10.10, iOS 8.0, *)
    public func allTagsWithClass(tagClass: UTTypeTagClass) -> [String]? {
        guard let unmanaged = UTTypeCopyAllTagsWithClass(stringValue, tagClass.name) else {
            return nil
        }
        
        return unmanaged.takeRetainedValue() as NSArray as? [String]
    }
    
    /// Creates a uniform type identifier for the type indicated by the
    /// specified tag. This is the primary function to use for going from
    /// tag (extension/MIMEType/OSType) to uniform type identifier.
    ///
    /// Optionally, the returned type identifiers must conform to the
    /// identified "conforming-to" type argument. This is a hint to the
    /// implementation to constrain the search to a particular tree of
    /// types. For example, the client may want to know the type
    /// indicated by a particular extension tag. If the client knows that
    /// the extension is associated with a directory (rather than a
    /// file), the client may specify "public.directory" for the
    /// conforming-to argument. This will allow the implementation to
    /// ignore all types associated with byte data formats (public.data
    /// base type). If more than one type is indicated, preference is
    /// given to a public type over a non-public type on the theory that
    /// instances of public types are more common, and therefore more
    /// likely to be correct. When there a choice must be made between
    /// multiple public types or multiple non-public types, the selection
    /// rules are undefined. Clients needing finer control should use
    /// `allIdentifiersForTagClass(_:tag:conformingToType:)`. If no declared type is
    /// indicated, a dynamic type identifier is generated which satisfies
    /// the parameters.
    ///
    /// - parameter tagClass: the class identifier of the tag argument
    /// - parameter tag: the tag string
    /// - parameter type: the identifier of a type to which the result must conform
    ///
    /// - returns: a new type identifier, or nil if `tagClass` is not a known tag class
    static func preferredIdentifierForTagClass(tagClass: UTTypeTagClass, tag: String, conformingToType type: UTType? = nil) -> UTType? {
        guard let unmanaged = UTTypeCreatePreferredIdentifierForTag(tagClass.name, tag, type?.stringValue) else {
            return nil
        }
        
        return UTType(unmanaged.takeRetainedValue() as String)
    }
    
    /// Creates an array of all uniform type identifiers indicated by th
    /// specified tag. 
    ///
    /// An overloaded tag (e.g., an extension used by
    /// several applications for different file formats) may indicate
    /// multiple types. If no declared type identifiers have the
    /// specified tag, then a single dynamic type identifier will be
    /// created for the tag.
    ///
    /// Optionally, the returned type identifiers
    /// must conform to the identified "conforming-to" type argument.
    /// This is a hint to the implementation to constrain the search to
    /// particular tree of types. For example, the client may want to
    /// know the type indicated by a particular extension tag. If the
    /// client knows that the extension is associated with a directory
    /// (rather than a file), the client may specify "public.directory"
    /// for the conforming-to argument. This will allow the
    /// implementation to ignore all types associated with byte data
    /// formats (public.data base type).
    ///
    /// - parameter tagClass: the class identifier of the tag argument
    /// - parameter tag: the tag string
    /// - parameter type: the identifier of a type to which the result must conform
    ///
    /// - returns: An array of uniform type identifiers, or nil if `tagClass` is
    /// not a known tag class
    static func allIdentifiersForTagClass(tagClass: UTTypeTagClass, tag: String, conformingToType type: UTType? = nil) -> [UTType]? {
        guard let unmanaged = UTTypeCreateAllIdentifiersForTag(tagClass.name, tag, type?.stringValue) else {
            return nil
        }
        
        let ids = unmanaged.takeRetainedValue() as NSArray as? [String]
        return ids?.map(UTType.init)
    }
}

extension UTType: Hashable {
    public var hashValue: Int { return stringValue.hashValue }
}

extension UTType: CustomStringConvertible {
    public var description: String { return stringValue }
}

extension UTType: Equatable {}

public func ==(lhs: UTType, rhs: UTType) -> Bool {
    return UTTypeEqual(lhs.stringValue, rhs.stringValue)
}
