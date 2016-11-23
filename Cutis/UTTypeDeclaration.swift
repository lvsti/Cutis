//
//  UTTypeDeclaration.swift
//  Cutis
//
//  Created by Tamas Lustyik on 2016. 01. 07..
//  Copyright © 2016. Tamas Lustyik. All rights reserved.
//

import Foundation
#if os(iOS)
import MobileCoreServices
#endif

public struct UTTypeDeclaration {
    public private(set) var dictionaryValue: [String: AnyObject]
    
    /// The uniform type identifier for the declared type.
    public var typeIdentifier: String { return dictionaryValue[kUTTypeIdentifierKey as String] as! String }
    
    /// The UTIs to which this identifier conforms.
    public var conformsToTypes: [UTType]? {
        guard let types = dictionaryValue[kUTTypeConformsToKey as String] as? [String] else {
            return nil
        }
        
        return types.map(UTType.init)
    }

    public typealias TagSpecification = [UTTypeTagClass: [String]]
    
    /// A dictionary containing conversions of the uniform type identifier to equivalent tags in other classification schemes.
    public var tagSpecification: TagSpecification? {
        guard let tagSpec = dictionaryValue[kUTTypeTagSpecificationKey as String] as? [String: AnyObject] else {
            return nil
        }
        
        return tagSpec
            .map({ (entry: (String, AnyObject)) -> TagSpecification.Element in
                let tagClass = UTTypeTagClass(name: entry.0)
                let tagValues = entry.1 as? [String] ?? [entry.1 as! String]
                return (tagClass, tagValues)
            })
            .reduce(TagSpecification(), { (tags: TagSpecification, next: TagSpecification.Element) -> TagSpecification in
                var tags = tags
                tags.updateValue(next.1, forKey: next.0)
                return tags
            })
    }
    
    /// An array of the names of the bundle icon resources to associate with this UTI.
    public var iconFiles: [String]? {
        if let files = dictionaryValue["UTTypeIconFiles"] as? [String] {
            return files
        }
        
        if let file = dictionaryValue[kUTTypeIconFileKey as String] as? String {
            return [file]
        }
        
        return nil
    }

    /// A user-visible description of this type (may be localized).
    public var typeDescription: String? { return dictionaryValue[kUTTypeDescriptionKey as String] as? String }
    
    /// A version string.
    public var version: String? { return dictionaryValue[kUTTypeVersionKey as String] as? String }
    
    /// The URL of a reference document describing this type.
    public var referenceURL: URL? { return dictionaryValue[kUTTypeReferenceURLKey as String] as? URL }
}

