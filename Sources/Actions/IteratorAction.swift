//
//  IteratorAction.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

class IteratorAction<E, T: IteratorGenerator>: Action where E == T.I.Element {

    private let generator: T
    private let closure: (E) -> Void
    private let timeFunction: TimeFunction

    init(generator: T, timeFunction: TimeFunction, closure: @escaping (E) -> Void) {
        self.generator = generator
        self.closure = closure
        self.timeFunction = timeFunction
    }

    func perform(with context: Context, sleep: SleepFunction) {
        let sequence: [E] = context.direction == .forward
            ? generator.makeIterator().filter { _ in true }
            : generator.makeIterator().reversed()

        for (index, value) in sequence.enumerated() {
            context.queue.addOperation { [closure] in closure(value) }
            sleep(timeFunction, index)
        }
    }
}
