//
//  OSType.swift
//  Cutis
//
//  Created by Tamas Lustyik on 2016. 01. 07..
//  Copyright © 2016. Tamas Lustyik. All rights reserved.
//

import Foundation


extension String {
    /// A helper function to canonically encode an OSType as a CFString
    /// suitable for use as a tag argument.
    ///
    /// - parameter osType: the OSType value to encode
    ///
    /// - returns: a string instance
    public init(osType: OSType) {
        let str = UTCreateStringForOSType(osType).takeRetainedValue()
        self.init(str as NSString)
    }
}

extension OSType {
    /// A helper function to canonically decode a string-encoded OSType
    /// back to the original OSType value.
    ///
    /// - parameter string: the string to decode
    ///
    /// - returns: the OSType value encoded in the string, or 0 if the string is not
    /// a valid encoding of an OSType
    public init(string: String) {
        self.init(UTGetOSTypeFromString(string))
    }
}
