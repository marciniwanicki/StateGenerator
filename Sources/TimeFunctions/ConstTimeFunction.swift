//
//  ConstTimeFunction.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

public class ConstTimeFunction: TimeFunction {

    public static let zero = ConstTimeFunction(0)

    private let timeInterval: TimeInterval

    public init(_ timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }

    public func timeInterval(for index: Int, direction: Direction) -> TimeInterval {
        return timeInterval
    }
}

extension TimeInterval: TimeFunction {

    public func timeInterval(for index: Int, direction: Direction) -> TimeInterval {
        return self
    }
}
