//
//  IndexAction.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

class IndexAction<E, T: IndexGenerator>: Action where T.T == E {

    private let generator: T
    private let closure: (E) -> Void
    private let timeFunction: TimeFunction

    init(generator: T, timeFunction: TimeFunction, closure: @escaping (E) -> Void) {
        self.generator = generator
        self.closure = closure
        self.timeFunction = timeFunction
    }

    func perform(with context: Context, sleep: SleepFunction) {
        let count = generator.count
        for index in 0..<count {
            let value = generator.generate(index: (context.direction == .forward ? index : count - 1 - index))
            context.queue.addOperation { [closure] in closure(value) }
            sleep(timeFunction, index)
        }
    }
}
