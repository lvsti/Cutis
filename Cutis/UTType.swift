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
    
    @available(OSX 10.10, iOS 8.0, *)
    public var isDeclared: Bool {
        return UTTypeIsDeclared(stringValue)
    }
    
    @available(OSX 10.10, iOS 8.0, *)
    public var isDynamic: Bool {
        return UTTypeIsDynamic(stringValue)
    }
    
    public var declaration: UTTypeDeclaration? {
        guard
            let unmanaged = UTTypeCopyDeclaration(stringValue),
            let dict = (unmanaged.takeRetainedValue() as NSDictionary) as? [String: AnyObject]
        else {
            return nil
        }
        
        return UTTypeDeclaration(dictionaryValue: dict)
    }
    
    public var declaringBundleURL: NSURL? {
        guard let unmanaged = UTTypeCopyDeclaringBundleURL(stringValue) else {
            return nil
        }
        
        return unmanaged.takeRetainedValue()
    }
    
    public var typeDescription: String? {
        guard let unmanaged = UTTypeCopyDescription(stringValue) else {
            return nil
        }
        
        return unmanaged.takeRetainedValue() as String
    }
    
    public func conformsTo(type: UTType) -> Bool {
        return UTTypeConformsTo(stringValue, type.stringValue)
    }
    
    public func preferredTagWithClass(tagClass: UTTypeTagClass) -> String? {
        guard let unmanaged = UTTypeCopyPreferredTagWithClass(stringValue, tagClass.name) else {
            return nil
        }
        
        return unmanaged.takeRetainedValue() as String
    }
    
    @available(OSX 10.10, iOS 8.0, *)
    public func allTagsWithClass(tagClass: UTTypeTagClass) -> [String]? {
        guard let unmanaged = UTTypeCopyAllTagsWithClass(stringValue, tagClass.name) else {
            return nil
        }
        
        return unmanaged.takeRetainedValue() as NSArray as? [String]
    }
    
    static func preferredIdentifierForTagClass(tagClass: UTTypeTagClass, tag: String, conformingToType type: UTType? = nil) -> UTType? {
        guard let unmanaged = UTTypeCreatePreferredIdentifierForTag(tagClass.name, tag, type?.stringValue) else {
            return nil
        }
        
        return UTType(unmanaged.takeRetainedValue() as String)
    }
    
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
