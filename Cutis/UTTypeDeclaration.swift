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
    
    public var typeIdentifier: String { return dictionaryValue[kUTTypeIdentifierKey as String] as! String }
    public var conformsToTypes: [UTType]? {
        guard let types = dictionaryValue[kUTTypeConformsToKey as String] as? [String] else {
            return nil
        }
        
        return types.map(UTType.init)
    }

    public typealias TagSpecification = [UTTypeTagClass: [String]]
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
            .reduce(TagSpecification(), combine: { (var tags: TagSpecification, next: TagSpecification.Element) -> TagSpecification in
                tags.updateValue(next.1, forKey: next.0)
                return tags
            })
    }
    
    public var iconFiles: [String]? {
        if let files = dictionaryValue["UTTypeIconFiles"] as? [String] {
            return files
        }
        
        if let file = dictionaryValue[kUTTypeIconFileKey as String] as? String {
            return [file]
        }
        
        return nil
    }

    public var typeDescription: String? { return dictionaryValue[kUTTypeDescriptionKey as String] as? String }
    public var version: String? { return dictionaryValue[kUTTypeVersionKey as String] as? String }
    public var referenceURL: NSURL? { return dictionaryValue[kUTTypeReferenceURLKey as String] as? NSURL }

    init(dictionaryValue: [String: AnyObject]) {
        self.dictionaryValue = dictionaryValue
    }
}

