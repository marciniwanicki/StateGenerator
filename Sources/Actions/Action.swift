//
//  Action.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

protocol Action {

    typealias SleepFunction = (TimeFunction, Int) -> ()
    typealias Context = (
        queue: OperationQueue,
        direction: Direction
    )

    func perform(with context: Context, sleep: SleepFunction)
}
