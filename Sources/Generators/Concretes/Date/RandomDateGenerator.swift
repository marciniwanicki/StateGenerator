//
//  RandomDateGenerator.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 05/04/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

class RandomDateGenerator: SingleValueGenerator {

    typealias T = Date

    func generate() -> Date {
        return Date()
    }
}
