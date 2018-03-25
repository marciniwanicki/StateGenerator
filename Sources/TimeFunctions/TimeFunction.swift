//
//  TimeFunction.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

protocol TimeFunction {

    func timeInterval(for index: Int, direction: Direction) -> TimeInterval
}
