//
//  UTTypeTagClass.swift
//  Cutis
//
//  Created by Tamas Lustyik on 2016. 01. 09..
//  Copyright © 2016. Tamas Lustyik. All rights reserved.
//

import Foundation
#if os(iOS)
import MobileCoreServices
#endif

public struct UTTypeTagClass {
    /// The name of this tag class
    public let name: String
    
    public static let FileExtension = UTTypeTagClass(name: kUTTagClassFilenameExtension as String)
    public static let MIMEType = UTTypeTagClass(name:kUTTagClassMIMEType as String)
    
    #if os(OSX)
    public static let AppleOSType = UTTypeTagClass(name: kUTTagClassOSType as String)
    public static let ApplePasteboardType = UTTypeTagClass(name: kUTTagClassNSPboardType as String)
    #endif
}

extension UTTypeTagClass: Hashable {
    public var hashValue: Int { return name.hashValue }
}

extension UTTypeTagClass: Equatable {}

public func ==(lhs: UTTypeTagClass, rhs: UTTypeTagClass) -> Bool {
    return lhs.name == rhs.name
}
