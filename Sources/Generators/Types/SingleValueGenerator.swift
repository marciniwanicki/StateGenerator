//
//  SingleValueGenerator.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

protocol SingleValueGenerator {

    associatedtype T

    func generate() -> T
}
