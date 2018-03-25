//
//  PerformAction.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

class PerformAction: Action {

    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    func perform(with context: Context, sleep: SleepFunction) {
        context.queue.addOperation(closure)
    }
}
