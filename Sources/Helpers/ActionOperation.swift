//
//  ActionOperation.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

class ActionOperation: Operation {

    private let action: Action
    private let context: Action.Context
    private let semaphore = DispatchSemaphore(value: 0)

    init(action: Action, context: Action.Context) {
        self.action = action
        self.context = context
    }

    override func main() {
        action.perform(with: context, sleep: sleep)
    }

    private func sleep(_ timeFunction: TimeFunction, _ index: Int) {
        let milliseconds = Int(timeFunction.timeInterval(for: index, direction: context.direction) * 1000.0)
        let timeout = DispatchTime.now() + .milliseconds(milliseconds)
        _ = semaphore.wait(timeout: timeout)
    }
}
