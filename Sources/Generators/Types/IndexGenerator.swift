//
//  IndexGenerator.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

public protocol IndexGenerator {

    associatedtype T

    var count: Int { get }

    func generate(index: Int) -> T
}
