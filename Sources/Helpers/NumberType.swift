//
//  NumberType.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

protocol NumberType {

    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
    static func / (lhs: Self, rhs: Self) -> Self
}

extension Double : NumberType { }
extension Float  : NumberType { }
extension Int    : NumberType { }
extension Int8   : NumberType { }
extension Int16  : NumberType { }
extension Int32  : NumberType { }
extension Int64  : NumberType { }
extension UInt   : NumberType { }
extension UInt8  : NumberType { }
extension UInt16 : NumberType { }
extension UInt32 : NumberType { }
extension UInt64 : NumberType { }
