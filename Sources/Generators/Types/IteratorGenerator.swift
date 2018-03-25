//
//  IteratorGenerator.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

protocol IteratorGenerator {

    associatedtype I: Sequence

    func makeIterator() -> I
}

extension CountableRange: IteratorGenerator { }
extension CountableClosedRange: IteratorGenerator { }
extension Array: IteratorGenerator { }
