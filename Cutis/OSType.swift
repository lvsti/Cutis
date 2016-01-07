//
//  OSType.swift
//  Cutis
//
//  Created by Tamas Lustyik on 2016. 01. 07..
//  Copyright © 2016. Tamas Lustyik. All rights reserved.
//

import Foundation


extension String {
    public init(osType: OSType) {
        let str = UTCreateStringForOSType(osType).takeRetainedValue()
        self.init(str as NSString)
    }
}

extension OSType {
    public init(string: String) {
        self.init(UTGetOSTypeFromString(string))
    }
}
